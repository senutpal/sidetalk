Rails.application.routes.draw do
  root "chatroom#index"
  get "login", to: "sessions#new"
  get "signup", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  resources :users, only: [:create]
  resources :messages, only: [:create]
end
