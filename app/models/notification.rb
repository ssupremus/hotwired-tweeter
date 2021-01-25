# frozen_string_literal: true

# notification model
class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :recipient, class_name: 'User'
  belongs_to :notifiable, polymorphic: true
  scope :recent, -> { order(created_at: :desc).limit(5) }
  scope :unread, -> { where(read_at: nil) }
  after_commit -> { NotificationRelayJob.perform_later(self) }
end
