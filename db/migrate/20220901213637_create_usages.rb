# frozen_string_literal: true

class CreateUsages < ActiveRecord::Migration[5.2]
  def change
    create_table :usages do |t|
      t.integer :usage_quantity, null: false
      t.integer :over_usage_bill, null: false

      t.timestamps
    end
  end
end
