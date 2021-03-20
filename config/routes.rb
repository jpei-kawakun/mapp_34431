Rails.application.routes.draw do
  devise_for :users

  root to: 'top#index'

  resources :users, only: [:show, :edit, :update]
  resources :relationships, only: [:create, :destroy]

end
