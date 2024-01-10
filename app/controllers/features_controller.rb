# frozen_string_literal: true

class FeaturesController < ApplicationController
  before_action :authorize_feature, only: %i[index new create]
  before_action :set_feature, only: %i[show]
  def index
    plan_id = params[:plan_id].to_i
    @features = Feature.where(plan_id: plan_id)
  end

  def new
    @feature = Feature.new
  end

  def show; end

  def create
    plan = Plan.find(params[:plan_id])
    @feature = plan.features.new(feature_param)
    if @feature.save!
      redirect_to plan_path(plan), notice: I18n.t('success.feature')
    else
      redirect_to new_plan_feature_path(plan), notice: I18n.t('failure.feature')
    end
  end

  private

  def authorize_feature
    authorize Feature
  end

  def feature_param
    params.require(:feature).permit(:name, :code, :unit_price, :max_unit_limit)
  end

  def set_feature
    @feature = Feature.find(params[:id])
  end
end
