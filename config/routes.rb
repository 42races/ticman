Rails.application.routes.draw do

  resources :registrations, only: [:index, :new, :create] do
    collection do
      get :confirm_email
    end

    member do
      get :resend_email_confirmation
    end
  end

  resources :passwords, only: [:edit, :update]

  resources :dashboard, only: [:index] do
    collection do
      get :search
    end
  end

  resource :sessions, only: [:new, :create, :destroy]

  root 'pages#index'

  get '/test', to: "pages#test"
end
