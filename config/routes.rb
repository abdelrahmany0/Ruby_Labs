# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :articles do
    resources :comments do
      resources :users
    end
  end

  get 'welcome/index'
  resource :users, only: [:create]
  get 'api/articles/:id', to: 'articles#api_show'
  get 'api/articles', to: 'articles#api_index'
  # get 'create_token', to: 'users#create'
  # post 'create_token', to: 'users#login'
  post '/login', to: 'users#login'
  get '/auto_login', to: 'users#auto_login'
  root 'articles#index'
end
