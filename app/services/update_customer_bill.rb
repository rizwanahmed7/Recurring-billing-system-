# frozen_string_literal: true

class UpdateCustomerBill
  def initialize(stripe_id, customer, total_bill)
    @stripe_id = stripe_id
    @customer = customer
    @total_bill = total_bill
  end

  def call
    Stripe::Customer.update(
      @stripe_id,
      { balance: (@customer.balance + @total_bill.to_i) }
    )
  end
end
