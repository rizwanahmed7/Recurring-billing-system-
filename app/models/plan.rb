# frozen_string_literal: true

class Plan < ApplicationRecord
  include CreatePrice

  has_many :features, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :transactions, dependent: :destroy
  belongs_to :user

  enum interval: { 'month, year': 0 }

  validates :name, :monthly_fee, presence: true
  validates :monthly_fee, numericality: { greater_than_or_equal_to: 0 }

  before_create :create_stripe_reference

  def create_stripe_reference
    response = Plan.price_reference(monthly_fee, name)
    self.stripe_price_id = response.id
  end
end
