# frozen_string_literal: true

# likes controller
class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_likeable

  def create
    if @likeable.likes.where(user: current_user).any?
      @likeable.likes.where(user: current_user).destroy_all
    else
      @likeable.likes.create(user: current_user)
      create_notification
    end
    # by updating we trigger turbo_stream
    @likeable.update(updated_at: Time.now)
    redirect_to @likeable.instance_of?(Comment) ? @likeable.commentable : @likeable
  end

  private

  def set_likeable
    @likeable = if params[:comment_id].present?
                  Comment.find(params[:comment_id])
                elsif params[:tweet_id].present?
                  Tweet.find(params[:tweet_id])
                end
  end

  def create_notification
    return if @likeable.user == current_user

    @likeable.notifications.create(recipient: @likeable.user,
                                   user: current_user,
                                   action: 'liked')
  end
end
