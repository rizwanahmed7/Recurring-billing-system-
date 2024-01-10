# frozen_string_literal: true

class AddPlanIdToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_reference :transactions, :plan, foreign_key: true
  end
end
