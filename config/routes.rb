Rails.application.routes.draw do
  devise_for :users
  resources :organizations, only: [:new, :create]

  root 'pages#index'
end
