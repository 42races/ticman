Rails.application.routes.draw do
  get 'registrations/new'

  get 'registrations/create'

  devise_for :users
  resources :registrations, only: [:new, :create]
  resources :organizations, only: [:new, :create]

  root 'pages#index'
end
