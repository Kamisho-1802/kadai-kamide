Rails.application.routes.draw do
  root "sessions#new"

  # ログイン関連
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  # ユーザー関連
  resources :users, only: [:new, :create, :edit, :update, :show]

  # 投稿関連
  resources :posts, only: [:index, :show, :new, :create]

  # マイページ
  get "mypage", to: "mypages#show"
end
