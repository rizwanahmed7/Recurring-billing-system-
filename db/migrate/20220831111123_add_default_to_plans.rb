# frozen_string_literal: true

class AddDefaultToPlans < ActiveRecord::Migration[5.2]
  def change
    change_column_default :plans, :interval, default: 0
  end
end
