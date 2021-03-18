Rails.application.routes.draw do
  devise_for :users

  root to: 'top#index'

  resources :users, only: :show
  resources :relationships, only: [:create, :destroy]

end
