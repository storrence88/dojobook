# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'users#index'
  get 'professional_profile', to: 'users#profile', as: :profile
  devise_for :users, controllers: { registrations: 'registrations' }, path: '',
    path_names: { sign_in: 'login', sign_up: 'signup' }
  resources :users
end
