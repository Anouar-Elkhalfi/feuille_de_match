Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :matches
  resources :seasons
  resources :championships
  resources :divisions
  get "/calendar", to: "calendars#index", as: :calendar

  # Defines the root path route ("/")
  # root "posts#index"
end
