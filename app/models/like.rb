# frozen_string_literal: true

# like model
class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true
  belongs_to :user
end
