# frozen_string_literal: true

# notifications controller
class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(recipient: current_user).recent
  end

  def mark_as_read
    @notifications = Notification.where(recipient: current_user)
                                 .unread

    @notifications.update_all(read_at: Time.zone.now)
    render json: { success: true }
  end
end
