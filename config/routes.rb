# frozen_string_literal: true

Rails.application.routes.draw do
  # devise_for :users
  get 'welcome/index'
  resources :articles do
    resources :comments do
      resources :users
    end
  end
  get 'api/articles/:id', to: 'articles#api_show'
  # get 'create_token', to: 'users#create'
  # post 'create_token', to: 'users#login'
  post '/login', to: 'users#login'
  get '/auto_login', to: 'users#auto_login'
  root 'articles#index'
end
