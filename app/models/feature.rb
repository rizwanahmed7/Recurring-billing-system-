# frozen_string_literal: true

class Feature < ApplicationRecord
  belongs_to :plan
  has_many :usages, dependent: :destroy
  has_many :users, through: :usages

  validates :name, :code, :max_unit_limit, :unit_price, presence: true
  validates :max_unit_limit, :unit_price, numericality: { greater_than_or_equal_to: 0 }
end
