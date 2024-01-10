# frozen_string_literal: true

class SubscriptionSession
  def initialize(param)
    @param = param
  end

  def call
    Stripe::Checkout::Session.retrieve(@param)
  end
end
