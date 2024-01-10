# frozen_string_literal: true

class SubscriptionService
  URL = 'subscriptions/success?session_id={CHECKOUT_SESSION_ID}&'
  def initialize(plan, buyer, root_url)
    @plan = plan
    @buyer = buyer
    @root_url = root_url
  end

  def call
    Stripe::Checkout::Session.create(
      customer: @buyer,
      success_url: @root_url + "#{URL}plan_id=#{@plan.id}",
      cancel_url: @root_url,
      payment_method_types: ['card'],
      mode: 'subscription',
      line_items: [{
        quantity: 1,
        price: @plan.stripe_price_id
      }]
    )
  end
end
