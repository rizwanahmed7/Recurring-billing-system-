# frozen_string_literal: true

class AddItervalToPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :interval, :integer, default: 0
  end
end
