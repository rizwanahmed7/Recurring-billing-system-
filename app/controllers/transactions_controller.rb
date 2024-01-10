# frozen_string_literal: true

class TransactionsController < ApplicationController
  def index
    @transactions = if current_user.transactions.length.positive?
                      current_user.transactions.includes(:user, :subscription, :plan).all
                    end
  end
end
