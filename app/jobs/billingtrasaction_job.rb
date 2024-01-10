# frozen_string_literal: true

class BillingtrasactionJob < ApplicationJob
  queue_as :default
  RUN_EVERY = 30.days
  def perform(subscription)
    total_bill = 0
    subscription.plan.features.each do |feature|
      total_quantity = feature.usages.where(user_id: subscription.user_id).maximum(:over_usage_bill)
      if total_quantity.to_i > feature.max_unit_limit
        total_bill += (total_quantity.to_i - feature.max_unit_limit) * feature.unit_price
      end
    end
    if total_bill.positive?
      customer = StripeCustomerService.new(subscription.user.stripe_id).call
      UpdateCustomerBill.new(subscription.user.stripe_id, customer, total_bill)
    end
    CustomerTransaction.new(subscription.user_id, subscription.id, subscription.plan_id).call
    NotificationMailer.recurring_bill(subscription, total_bill).deliver_now
    self.class.set(wait: RUN_EVERY).perform_later(subscription)
  end
end
