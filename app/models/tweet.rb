# frozen_string_literal: true

# tweet model
class Tweet < ApplicationRecord
  after_create_commit { broadcast_prepend_to 'tweets' }
  after_update_commit { broadcast_replace_to 'tweets' }
  after_destroy_commit { broadcast_remove_to 'tweets' }

  belongs_to :user
  belongs_to :original_tweet, class_name: 'Tweet', optional: true
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  validates :body, presence: true
  has_many :notifications, as: :notifiable

  def mentions
    regex = /@(\w+)/

    body.scan(regex).flatten
  end

  def mentioned_users
    User.where(username: mentions)
  end
end
