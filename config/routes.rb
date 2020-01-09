Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
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
  resources :products, only: [:index, :new, :create, :show]
  resources :users, only: [:index, :show, :edit, :update, :new]
  resources :signup, only: [:new ]do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'  #入力が全て完了
      get 'step4'
      get 'step5'  #登録完了後
    end
  end
end
