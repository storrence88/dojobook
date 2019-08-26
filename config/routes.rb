# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'users#index'
  devise_for :users, controllers: { registrations: 'registrations' }, path: '',
    path_names: { sign_in: 'login', sign_up: 'signup' }
  resources :users
end
