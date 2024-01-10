# frozen_string_literal: true

class AddUnitPriceMaxUnitLimitToFeatures < ActiveRecord::Migration[5.2]
  def change
    add_column :features, :unit_price, :decimal, null: false
    add_column :features, :max_unit_limit, :integer, null: false
  end
end
