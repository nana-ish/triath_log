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

# 管理者用各機能ルーティング
  namespace :admin do
    root to: "homes#top"
    resources :reces,only:[:new,:index,:edit,:create,:destroy,:update]
    resources :end_users,only:[:show,:index,:edit,:update]
    resources :reviews,only:[:update,:edit]
  end

# 管理者用各機能ルーティング
  scope module: :public do    #(urlにpubicを含めたくないため"scope module: :〇〇 do"を使う)
    root to: "homes#top"
    get 'about'=>"homes#about"
    resources :reviews,only:[:new,:index,:show,:create,:destroy,:edit,:update]
    resources :reces,only:[:show,:index]
    resources :end_users,only:[:show,:edit,:update]
    get 'end_users/unsubscribe'
    get 'end_users/withdraw'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
