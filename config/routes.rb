Rails.application.routes.draw do

  resources :registrations, only: [:new, :create]
  resources :organizations, only: [:new, :create]

  root 'pages#index'
end
