# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }, path: '',
    path_names: { sign_in: 'login', sign_up: 'signup' }
  
  authenticated :user do
    root 'dashboard#index', as: :authenticated_root
    resources :friendship, only: %i[new create destroy]
  end
  
  root 'welcome#index'
  resources :users
end
