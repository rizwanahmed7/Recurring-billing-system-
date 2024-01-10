# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :subscription
  belongs_to :plan
end
