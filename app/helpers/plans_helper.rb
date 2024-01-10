# frozen_string_literal: true

module PlansHelper
  def find_active_subscription(plan)
    if get_subscription = Subscription.find_by(user_id: current_user.id, plan_id: plan.id)
      Stripe::Subscription.retrieve(get_subscription&.stripe_id).status != 'active'
    else
      true
    end
  end
end
