Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root 'users#index'
  get "signup", to: "signup#index"
  resources :products, only: [:show]
  resources :users
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
