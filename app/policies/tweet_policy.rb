# frozen_string_literal: true

# tweet policy
class TweetPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    true
  end

  def update?
    owner?
  end

  def show?
    true
  end

  def destroy?
    owner?
  end

  private

  def owner?
    user.id == record.user_id
  end
end
