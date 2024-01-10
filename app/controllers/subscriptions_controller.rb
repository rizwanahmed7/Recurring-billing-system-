# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  before_action :set_plan, only: %i[new create]
  before_action :set_subscription, only: %i[success]
  before_action :authorize_subscription, only: %i[index]

  def index
    @subscriptions = (current_user.subscriptions.all if current_user.subscriptions.length.positive?)
  end

  def new
    @subscription = @plan.subscriptions.new
    authorize @subscription
  end

  def create
    session = SubscriptionService.new(@plan, current_user.stripe_id, root_url).call
    redirect_to session.url, allow_other_host: true
  end

  def success
    session = SubscriptionSession.new(params[:session_id]).call
    @subscription.stripe_id = session.subscription
    redirect_to plan_path(@subscription.plan) if @subscription.save!
    BillingtrasactionJob.perform_now(@subscription)
    authorize @subscription
  end

  private

  def set_subscription
    @subscription = Subscription.new(subscription_params)
    @subscription.user_id = current_user.id
    @subscription.plan_id = params[:plan_id]
  end

  def authorize_subscription
    authorize Subscription
  end

  def subscription_params
    params.permit(:plan_id)
  end

  def set_plan
    @plan = Plan.find(params[:plan_id])
  end
end
