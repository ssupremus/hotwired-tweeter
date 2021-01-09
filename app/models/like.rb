# frozen_string_literal: true

# like model
class Like < ApplicationRecord
  belongs_to :tweet
  belongs_to :user
end
