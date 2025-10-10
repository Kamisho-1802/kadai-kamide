Rails.application.routes.draw do
  # トップページ
  root 'home#index'

  # deviseを使ったUser認証
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # マイページ関連
  resources :mypages, only: [:show, :edit, :update]

  # 投稿関連
  resources :posts do
    # 投稿に対してお気に入りを紐づける
    resource :favorite, only: [:create, :destroy]
  end

  # ログインしていないユーザーをトップへ飛ばす（任意）
  get '*path', to: redirect('/'), constraints: lambda { |req|
    !req.path.starts_with?('/rails/active_storage')
  }
end
