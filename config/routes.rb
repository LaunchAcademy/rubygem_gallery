Rails.application.routes.draw do
  resources :ruby_gems do
    resources :reviews, only: [:create, :edit, :update, :destroy]
  end
  resources :reviews, only: [:edit, :update, :destroy]
  devise_for :users
  root 'ruby_gems#index'

  namespace :admin do
    resources :reviews, only: [:index, :destroy]
  end
end
