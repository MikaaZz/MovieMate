Rails.application.routes.draw do

  devise_for :users
  root to: "listings#index"
  resources :listings
  resources :users, only: [:show, :edit, :update]
end
