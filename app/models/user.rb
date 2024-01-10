# frozen_string_literal: true

class User < ApplicationRecord
  include StripeCustomerCreation

  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_many :plans, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_one_attached :avatar
  has_many :usages, dependent: :destroy
  has_many :features, through: :usages
  has_many :transactions, dependent: :destroy

  enum role: { admin: 0, buyer: 1 }

  validates :avatar, content_type: %i[png jpg jpeg], dimension: { width: 240, height: 240 }

  before_create :set_default_type

  def set_default_type
    response = User.create_customer(email)
    self.stripe_id = response.id
    self.role ||= :buyer
  end

  def avatar_thumbnail
    avatar
  end
end
