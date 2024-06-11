Rails.application.routes.draw do
  get 'profile/index'
  devise_for :users, skip: [:sign_out] do
    get 'sign_out', to: 'devise/sessions#destroy'
  end
  resources :posts do 
    resources :comments, only: [:create, :destroy, :edit, :comments]
    resources :likes, only: [:create]
    get :likes, to: "likes#destroy"
  end
  root "home#index"
  resources :home, only: [:index] 
end