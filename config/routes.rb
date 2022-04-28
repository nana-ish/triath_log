Rails.application.routes.draw do

# 管理者用ログイン機能
# URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
# エンドユーザー用ログイン機能
# URL /end_user/sign_in ...
  devise_for :end_users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
#ゲストログイン用に追加
  devise_scope :end_user do
    post 'public/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

# 管理者用各機能ルーティング
  namespace :admin do
    root to: "homes#top"
    resources :races,only:[:new,:show,:edit,:create,:update,:destroy]
    resources :end_users,only:[:show,:index,:edit,:update]
    resources :districts,only:[:create,:edit,:update,:destroy]
    resources :reviews,only:[:index,:show,:destroy]do
      resources :review_comments,only:[:destroy]
   end
  end

# 管理者用各機能ルーティング
  scope module: :public do    #(urlにpubicを含めたくないため"scope module: :〇〇 do"を使う)
    root to: "homes#top"
    get 'about'=>"homes#about"
    get "search" => "searches#index"
    resources :reviews,only:[:new,:index,:show,:create,:destroy,:edit,:update]do
       resources :review_favorites,only:[:create,:destroy]
       resources :review_comments,only:[:create,:destroy]
    end

    resources :races,only:[:show] do
      resources :race_favorites, only:[ :create, :destroy]
    end

    resources :end_users,only:[:index,:show,:edit,:update,:destroy] do
      resources :race_favorites,only:[:index,:show]
      resources :review_favorites,only:[:index,:show]
    end

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
