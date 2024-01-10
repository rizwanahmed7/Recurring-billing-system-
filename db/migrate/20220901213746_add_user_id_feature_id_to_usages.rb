# frozen_string_literal: true

class AddUserIdFeatureIdToUsages < ActiveRecord::Migration[5.2]
  def change
    add_reference :usages, :user, foreign_key: true
    add_reference :usages, :feature, foreign_key: true
  end
end
