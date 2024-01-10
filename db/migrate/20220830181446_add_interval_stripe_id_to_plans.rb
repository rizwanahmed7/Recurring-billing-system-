# frozen_string_literal: true

class AddIntervalStripeIdToPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :interval, :integer
    add_column :plans, :stripe_price_id, :string
  end
end
