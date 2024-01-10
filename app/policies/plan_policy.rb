# frozen_string_literal: true

class PlanPolicy < ApplicationPolicy
  def new?
    @user.admin?
  end

  def create?
    @user.admin?
  end
end
