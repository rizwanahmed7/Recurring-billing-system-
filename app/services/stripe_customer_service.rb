# frozen_string_literal: true

class StripeCustomerService
  def initialize(stripe_id)
    @stripe_id = stripe_id
  end

  def call
    Stripe::Customer.retrieve(@stripe_id)
  end
end
