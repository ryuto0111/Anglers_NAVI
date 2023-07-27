Rails.application.routes.draw do

  # 顧客用
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :user do
    post "guest_sign_in", to: "public/sessions#guest_sign_in"
  end

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: "homes#top"
    get '/about' => 'homes#about', as: 'about'

    resources :posts, only: [:index, :show, :edit, :update, :new, :create, :destroy] do
      resources :post_comments, only: [:create, :destroy]
      resource  :favorites,     only: [:create, :destroy]
      collection do
        get 'search'
      end
    end
    resources :tagsearches, only: [:show]

    resources :messages, only: [:create]
    resources :rooms, only: [:create, :index, :show]

    resources :users, only: [:show, :edit, :update] do
      get '/confirm' => 'users#confirm'
      patch '/quit' => 'users#quit'
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
  end

  namespace :admin do
    get '/' => 'homes#top'
    resources :tags, only: [:index, :create, :edit, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index, :show, :edit, :update, :new, :create, :destroy] do
      resources  :post_comments, only: [:destroy]
      collection do
        get 'search'
      end
    end
    resources :tagsearches, only: [:show]
  end

end
