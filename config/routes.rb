# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :tweets do
    resource :like
    resources :comments
  end

  root 'tweets#index'
end
