# frozen_string_literal: true

# tweet policy
class TweetPolicy < ApplicationPolicy
  def update?
    owner?
  end

  private

  def owner?
    user.id == record.user_id
  end
end
