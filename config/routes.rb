Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :matches

  # Defines the root path route ("/")
  # root "posts#index"
end
