# frozen_string_literal: true

# notification model
class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :recipient, class_name: 'User'
  belongs_to :notifiable, polymorphic: true
end
