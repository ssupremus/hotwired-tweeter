# frozen_string_literal: true

# notification relay job
class NotificationRelayJob < ApplicationJob
  queue_as :default

  def perform(notification)
    html = ApplicationController.render(partial: "notifications/#{notification.notifiable_type
                                                                              .underscore
                                                                              .pluralize}/#{notification.action}",
                                        locals: { notification: notification },
                                        formats: [:html])
    notifications_count = Notification.where(recipient: notification.recipient).unread.count
    ActionCable.server.broadcast "notifications:#{notification.recipient_id}", { html: html,
                                                                                 count: notifications_count }
  end
end
