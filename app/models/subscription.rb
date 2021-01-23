# frozen_string_literal: true

# subscription model
class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :followee, class_name: 'User'
end
