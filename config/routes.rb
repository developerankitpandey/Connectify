Rails.application.routes.draw do
  get 'profile/index'
  devise_for :users
  resources :posts do 
    resources :comments, only: [:create, :destroy, :edit, :comments]
  end
  root "home#index"
  resources :home, only: [:index] # Limiting routes to only index if that's the intent
end