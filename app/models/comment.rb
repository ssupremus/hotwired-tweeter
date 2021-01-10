# frozen_string_literal: true

class Comment < ApplicationRecord
  after_create_commit { broadcast_prepend_to 'comments' }
  after_update_commit { broadcast_replace_to 'comments' }
  after_destroy_commit { broadcast_remove_to 'comments' }

  belongs_to :tweet
  belongs_to :user
  validates :body, presence: true
end
