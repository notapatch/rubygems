Rails.application.routes.draw do
  resources :lessons
  get 'users/index'
  devise_for :users
  resources :courses
  resources :users, only: [:index, :edit, :update, :show]
  get 'home/index'
  get 'home/activity'
  root "home#index"
end
