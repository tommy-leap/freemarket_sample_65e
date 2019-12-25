Rails.application.routes.draw do
  root 'users#index'

  resources :products, only: [:show]
end
