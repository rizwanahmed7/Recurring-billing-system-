# frozen_string_literal: true

module CreatePrice
  extend ActiveSupport::Concern
  CURRENCY = 'usd'

  class_methods do
    def price_reference(monthly_fee, name)
      Stripe::Price.create({
                             unit_amount: monthly_fee.to_i * 100,
                             currency: CURRENCY,
                             recurring: { interval: 'month' },
                             product_data: { name: name }
                           })
    end
  end
end
