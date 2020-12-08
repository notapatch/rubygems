Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  resources :courses
  resources :users, only: [:index]
  get 'home/index'
  get 'home/activity'
  root "home#index"
end
