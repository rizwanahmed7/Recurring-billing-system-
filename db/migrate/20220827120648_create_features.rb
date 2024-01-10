# frozen_string_literal: true

class CreateFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.references :plan, foreign_key: true

      t.timestamps
    end
  end
end
