Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "home#index"
  resources :home, only: [:index, :destroy]
  resources :login, only: [:new, :create]
  resources :sign_up, only: [:new, :create]
end
