Rails.application.routes.draw do

  namespace :admin do
    get 'posts/index'
    get 'posts/show'
    get 'posts/edit'
  end
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

    get "users/:id/order_posts" => "posts#order_posts", as: "user_orders"
    resources :posts do
      resource :like, only: [:create, :destroy]
      resources :orders, only: [:create]
      get "/orders" => "orders#order"
    end

    get "searches/search" => "searches/search", as: "search"

  end

  # 管理者用

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do

    resources :users, only: [:index, :show, :edit, :update]

    resources :genres, only: [:index, :edit, :create, :update]

    resources :posts, only: [:index, :show, :update, :destroy, :edit]


  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
