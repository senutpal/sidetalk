Rails.application.routes.draw do
  root "chatroom#index"
  get "login", to: "sessions#new"
  get "signup", to: "sessions#new"
end
