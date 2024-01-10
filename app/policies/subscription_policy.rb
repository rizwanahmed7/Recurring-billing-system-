# frozen_string_literal: true

class SubscriptionPolicy < ApplicationPolicy
  def index?
    @user.buyer?
  end

  def show?
    @user.buyer?
  end

  def new?
    @user.buyer?
  end

  def create?
    new?
  end

  def success?
    create?
  end
end
