Rails.application.routes.draw do
  get 'purchase/index'
  get 'purchase/done'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  
  devise_scope :user do
    get 'step1', to: 'users/registrations#step1'
    post 'step1',  to: 'users/registrations#create_step1'
    get 'users/sign_in', to: 'users/sessions#new'
  end
  root 'users#index'
  get "users/logout", to: "users#logout"
  get "users/identification", to: "users#identification"
  get "products/detail/:id", to: "products#detail", as: :products_detail
  get "users/profile", to: "users#profile"
  get "users/edit", to: "users#edit"
  get "signup", to: "signup#index"
  get 'products/error'
  get 'users/listing', to: "users#listing"
  get 'users/progress', to: "users#progress"
  get 'users/completed', to: "users#completed"

  resources :card, only: [:create, :show, :edit] do
    collection do
      post 'delete', to: 'card#delete'
      post 'show', to: 'card#show'
    end
    member do
      get 'add'
    end
  end 
  resources :products do
  collection do
    get 'get_category_children', defaults: { format: 'json' }
    get 'get_category_grandchildren', defaults: { format: 'json' }
  end
end
  get :dynamic_select_category, to: 'products#dynamic_select_category'
  resources :users, only: [:index, :show, :edit, :update, :new]
  resources :signup do
    collection do
      get 'step1'
      post 'step2'
      post 'step3'  #入力が全て完了
      get 'step4'  #登録完了後
    end
  end
end
