# frozen_string_literal: true

# likes controller
class LikesController < ApplicationController
  before_action :set_tweet

  def create
    if @tweet.likes.where(user: current_user).any?
      @tweet.likes.where(user: current_user).destroy_all
    else
      @tweet.likes.create(user: current_user)
      create_notification
    end
    # by updating we trigger turbo_stream
    @tweet.update(updated_at: Time.now)
    redirect_to @tweet
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

  def create_notification
    return if @tweet.user == current_user

    @tweet.notifications.create(recipient: @tweet.user,
                                user: current_user,
                                action: 'liked')
  end
end
