# frozen_string_literal: true

class UsagesController < ApplicationController
  before_action :set_usage, only: %i[edit update]
  before_action :usage_update, only: %i[update]
  before_action :authorize_usage, only: %i[index edit update]

  def index
    @usages = Usage.includes(:user, :feature).all
  end

  def new
    feature = Feature.find(params[:feature_id])
    @usage = feature.usages.new
  end

  def create
    usage = current_user.usages.new(usage_params)
    if usage.save!
      redirect_to feature_path(usage.feature.id), notice: I18n.t('success.usage')
    else
      redirect_to new_feature_usage_path, notice: I18n.t('failure.usage')
    end
  end

  def edit; end

  def update
    if @usage.update!(usage_update)
      redirect_to usages_path, notice: I18n.t('success.usageupdate')
    else
      redirect_to edit_usage_path(@usage), notice: I18n.t('failure.usageupdate')
    end
  end

  private

  def authorize_usage
    authorize Usage
  end

  def usage_params
    params.require(:usage).permit(:feature_id, :usage_quantity)
  end

  def set_usage
    @usage = Usage.find(params[:id])
  end

  def usage_update
    params.require(:usage).permit(:usage_quantity)
  end
end
