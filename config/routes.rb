Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  resources :listings
  resources :users, only: [:show, :edit, :update]

end
