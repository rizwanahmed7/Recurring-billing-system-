# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  has_many :transactions, dependent: :destroy

  validates :stripe_id, presence: true

  before_create :set_date

  private

  def set_date
    self.date = Time.zone.today
  end
end
