# frozen_string_literal: true

require 'stripe'
class PlansController < ApplicationController
  before_action :authorize_plan, only: %i[new create]
  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def show
    @plan = Plan.find(params[:id])
    @subscription = @plan.subscriptions.build
  end

  def create
    user = User.find(current_user.id)
    plan = user.plans.new(plan_param)
    if plan.save!
      redirect_to plan, notice: I18n.t('success.plan')
    else
      redirect_to new_plan_path, notice: I18n.t('failure.plan')
    end
  end

  private

  def authorize_plan
    authorize Plan
  end

  def plan_param
    params.require(:plan).permit(:name, :monthly_fee)
  end
end
