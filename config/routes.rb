Rails.application.routes.draw do
  # devise_for :users
  root 'users#index'
  get "signup", to: "signup#index"
  get 'products/error'
  resources :products, only: [:new, :create]
  resources :users, only: [:index, :edit, :update]
  resources :signup, only: [:new]do
    collection do
      get 'step1'
      post 'step2'
      post 'step3'  #入力が全て完了
      post 'step4'
      get 'complete_signup'  #登録完了後
    end
  end
end
