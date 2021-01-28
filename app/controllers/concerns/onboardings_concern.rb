# frozen_string_literal: true

# onboardings concern
module OnboardingsConcern
  extend ActiveSupport::Concern

  def tweet?
    @user.tweets.any?
  end

  def comment?
    @user.comments.any?
  end
end
