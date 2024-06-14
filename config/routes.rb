Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  root "home#index"

  devise_for :users, skip: [:sign_out] do
    get 'sign_out', to: 'devise/sessions#destroy'
  end
  
  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create, :show]
  end
  
  resources :posts do 
    resources :comments, only: [:create, :destroy, :edit, :comments]
    resources :likes, only: [:create]
    get :likes, to: "likes#destroy"
  end

  resources :home, only: [:index] 
  resources :profile, only: [ :index, :create, :new, :show, :update ]
end