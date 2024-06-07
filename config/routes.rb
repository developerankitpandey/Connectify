Rails.application.routes.draw do
  get 'profile/index'
  devise_for :users
  resources :posts
  root "home#index"
  resources :home, only: [:index] # Limiting routes to only index if that's the intent
end