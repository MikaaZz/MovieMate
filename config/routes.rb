Rails.application.routes.draw do
  get 'bookings/show'

  devise_for :users
  root to: "pages#home"
  resources :listings
  resources :users, only: [:show, :edit, :update] do
    resources :bookings, only: [:show]
  end
end
