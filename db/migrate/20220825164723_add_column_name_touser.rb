# frozen_string_literal: true

class AddColumnNameTouser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false, default: ''
  end
end
