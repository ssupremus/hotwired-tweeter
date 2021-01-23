# frozen_string_literal: true

# users controller
class UsersController < ApplicationController
  before_action :user

  def show
    @tweets = @user.tweets
                   .where
                   .not(id: nil)
                   .order(created_at: :desc)
    @tweet = @user.tweets.new
  end

  private

  def user
    @user = User.find(params[:id])
  end
end
