Rails.application.routes.draw do
  root "sessions#new"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :users, only: [:new, :create, :edit, :update, :show]
  resources :posts, only: [:index, :show, :new, :create]
end
