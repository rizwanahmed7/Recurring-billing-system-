# frozen_string_literal: true

class RemoveItervalFromPlans < ActiveRecord::Migration[5.2]
  def change
    remove_column :plans, :interval, :integer
  end
end
