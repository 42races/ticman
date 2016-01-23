Rails.application.routes.draw do

  resources :registrations, only: [:index, :new, :create] do
    collection do
      get :confirm_email
    end
  end

  resources :passwords, only: [:edit, :update]

  root 'pages#index'
end
