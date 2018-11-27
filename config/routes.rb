Rails.application.routes.draw do
  devise_for :users
  resources :chat_rooms, only: [:new, :create, :show, :index]
  resources :rooms, only: [:create, :show]
  root 'users#index'
end
