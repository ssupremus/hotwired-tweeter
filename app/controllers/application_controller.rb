# frozen_string_literal: true

# application controller
class ApplicationController < ActionController::Base
  before_action :notifications

  private

  def notifications
    @notifications = Notification.where(recipient: current_user).unread
  end
end
