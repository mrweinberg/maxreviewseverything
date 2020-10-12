# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :reviews
  root to: 'reviews#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
