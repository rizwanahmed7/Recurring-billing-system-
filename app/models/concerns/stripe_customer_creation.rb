# frozen_string_literal: true

module StripeCustomerCreation
  extend ActiveSupport::Concern

  class_methods do
    def create_customer(email)
      Stripe::Customer.create(email: email)
    end
  end
end
