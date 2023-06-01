Rails.application.routes.draw do
  get 'bookings/show'

  devise_for :users
  root to: "listings#index"
  resources :listings do
    resources :bookings, only: [:new, :create, :show]
    resources :reviews, only: [:new, :create, :show]
  end
  resources :users, only: [:show, :edit, :update] do
    resources :bookings, only: [:show]
  end
end
