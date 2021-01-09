# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_tweet

  def create
    @tweet.update(likes_count: @tweet.likes_count + 1)
    redirect_to @tweet
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end
