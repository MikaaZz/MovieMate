Rails.application.routes.draw do
  get 'reviews/show'
  get 'reviews/new'
  get 'reviews/create'
  get 'bookings/show'

  devise_for :users
  root to: "listings#index"
  resources :listings
  resources :users, only: [:show, :edit, :update] do
    resources :bookings, only: [:show]
  end
end
