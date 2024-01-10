# frozen_string_literal: true

class AddActiveAndStripeIdToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :stripe_id, :string
  end
end
