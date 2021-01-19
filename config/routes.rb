Rails.application.routes.draw do
  root 'hangouts#index'
  get 'hangouts/index'
  devise_for :users
  resources :messages, only: :create
end
