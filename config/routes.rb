# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :tweets do
    resource :like
    resources :comments
  end
  resources :users, only: %i[show] do
    resource :subscription
  end

  root 'tweets#index'
end
