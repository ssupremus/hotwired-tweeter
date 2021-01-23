# frozen_string_literal: true

# subscriptions controller
class SubscriptionsController < ApplicationController
  before_action :user

  def create
    if current_user.subscriptions.where(followee_id: @user.id).none?
      current_user.subscriptions.create(followee_id: @user.id)
      create_notification
    else
      current_user.subscriptions.where(followee_id: @user.id).destroy_all
    end
    redirect_to @user
  end

  private

  def user
    @user = User.find(params[:user_id])
  end

  def create_notification
    current_user.notifications.create(recipient: @user,
                                      user: current_user,
                                      action: 'followed')
  end
end
