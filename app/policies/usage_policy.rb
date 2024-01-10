# frozen_string_literal: true

class UsagePolicy < ApplicationPolicy
  def index?
    @user.admin?
  end

  def edit?
    @user.admin?
  end

  def update?
    edit?
  end
end
