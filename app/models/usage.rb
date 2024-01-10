# frozen_string_literal: true

class Usage < ApplicationRecord
  belongs_to :user
  belongs_to :feature
  before_create :create_bill
  validates :usage_quantity, presence: true

  private

  def create_bill
    usages = Usage.where(user_id: user_id, feature_id: feature_id).sum(:usage_quantity)
    self.over_usage_bill = if usages.zero?
                             usage_quantity
                           else
                             usages + usage_quantity
                           end
  end
end
