# frozen_string_literal: true

class CustomerTransaction
  def initialize(subscription_user_id, subscription_id, subscription_plan_id)
    @subscription_user_id = subscription_user_id
    @subscription_id = subscription_id
    @subscription_plan_id = subscription_plan_id
  end

  def call
    Transaction.create(
      {
        user_id: @subscription_user_id,
        subscription_id: @subscription_id,
        plan_id: @subscription_plan_id
      }
    )
  end
end
