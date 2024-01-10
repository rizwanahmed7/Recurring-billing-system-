# frozen_string_literal: true

class FeaturePolicy < ApplicationPolicy
  def index?
    @user.admin? || @user.buyer
  end

  def new?
    @user.admin?
  end

  def create?
    new?
  end
end
