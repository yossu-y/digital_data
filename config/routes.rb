Rails.application.routes.draw do

  # 利用者用

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about", as: "about"

    get "users/unsubscribe/:id" => "users#unsubscribe", as: "unsubscribe"
    resources :users, only: [:index, :update, :show, :edit]

    get "users/:id/orders" => "orders#user_orders", as: "user_orders"
    resources :posts do
      resource :like, only: [:create, :destroy]
      resources :orders, only: [:create]
      get "/orders" => "orders#order"
    end

  end

  # 管理者用

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do

    resources :users, only: [:index, :show, :edit, :update]

    resources :genres, only: [:index, :edit, :create, :update]


  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
