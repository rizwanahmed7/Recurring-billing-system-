# frozen_string_literal: true

class AddBillingDayToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :date, :datetime
  end
end
