Rails.application.routes.draw do
  devise_for :users

  root to: 'top#index'

  resources :users, only: [:show, :edit, :update]
  resources :relationships, only: [:create, :destroy]

  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:index, :create]
  end

end
