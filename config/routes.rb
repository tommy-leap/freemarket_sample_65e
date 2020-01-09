Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  
  devise_scope :user do
    get 'step1', to: 'users/registrations#new_step1'
    post 'step1',  to: 'users/registrations#create_step1'
  end
  root 'users#index'
  get "users/logout", to: "users#logout"
  get "users/identification", to: "users#identification"
  get "products/detail/:id", to: "products#detail", as: :products_detail
  get "users/profile", to: "users#profile"
  get "users/edit", to: "users#edit"
  get "signup", to: "signup#index"
  get 'products/error'
  get 'users/cardlist_first', to: "users#cardlist_first"
  get 'users/cardlist', to: "users#cardlist"
  resources :products, only: [:index, :new, :create, :show] do
  collection do
    get 'get_category_children', defaults: { format: 'json' }
    get 'get_category_grandchildren', defaults: { format: 'json' }
  end
end
get :dynamic_select_category, to: 'products#dynamic_select_category'
  resources :users, only: [:index, :show, :edit, :update, :new]
  resources :signup, only: [:new ]do
    collection do
      get 'step1'
      post 'step2'
      post 'step3'  #入力が全て完了
      post 'step4'
      get 'step5'  #登録完了後
    end
  end
end
