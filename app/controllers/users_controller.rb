# frozen_string_literal: true

# users controller
class UsersController < ApplicationController
  include OnboardingsConcern
  before_action :user
  before_action :onboarding_completion, only: :show

  def show
    @tweets = @user.tweets
                   .where
                   .not(id: nil)
                   .order(created_at: :desc)
    @tweet = @user.tweets.new
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :username)
  end

  def onboarding_completion
    steps = OnboardingsConcern.instance_methods
    complete = steps.select { |step| send(step) }
    @onboarding_completion = complete.length / steps.length.to_f * 100
  end
end
