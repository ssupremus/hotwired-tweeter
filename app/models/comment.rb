# frozen_string_literal: true

# comment model
class Comment < ApplicationRecord
  after_create_commit { broadcast_prepend_to 'comments' }
  after_update_commit { broadcast_replace_to 'comments' }
  after_destroy_commit { broadcast_remove_to 'comments' }

  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_rich_text :body
  has_many :notifications, as: :notifiable
  validates :body, presence: true, if: -> { rich_text_body.body.attachments.none? }
  after_create :notify_mentioned_users

  def mentions
    regex = /@(\w+)/

    body.to_s.scan(regex).flatten
  end

  def mentioned_users
    User.where(username: mentions)
  end

  def notify_mentioned_users
    mentioned_users.each do |mentioned_user|
      notifications.create(recipient: mentioned_user,
                           user: user,
                           action: 'mentioned')
    end
  end
end
