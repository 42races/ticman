Rails.application.routes.draw do
  resources :organizations, only: [:new, :create]
end
