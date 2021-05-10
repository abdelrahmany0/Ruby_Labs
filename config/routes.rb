# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :articles do
    resources :comments
  end
  get 'api/articles/:id', to: 'articles#api_show'
  root 'articles#index'
end
