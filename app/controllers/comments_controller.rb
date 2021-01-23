# frozen_string_literal: true

# comments controller
class CommentsController < ApplicationController
  before_action :set_tweet
  before_action :set_comment, only: %i[update destroy]
  after_action :create_notification, only: :create

  def create
    @comment = @tweet.comments.build(comment_params)

    if @comment.save
      # trigger turbo stream
      @tweet.update(updated_at: Time.now)
      respond_to do |format|
        format.json { render json: {}, status: :ok }
        format.html { redirect_to @tweet }
      end
    else
      format.html { render :new }
      format.json { render json: @comment.errors, status: :unprocessable_entity }
    end
  end

  def update
    if @comment.update(comment_params)
      format.html { redirect_to @tweet, notice: 'Comment updated.' }
      format.json { render :index, status: :created }
    else
      format.html { render :new }
      format.json { render json: @comment.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @tweet, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

  def set_comment
    @comment = @tweet.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment)
          .permit(%i[body tweet_id])
          .merge(user_id: current_user.id)
  end

  def create_notification
    return if @tweet.user == current_user

    @tweet.notifications.create(recipient: @tweet.user,
                                user: current_user,
                                action: 'commented')
  end
end
