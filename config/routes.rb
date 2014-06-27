Rails.application.routes.draw do
  resources :ruby_gems do
    resources :reviews, only: [:create, :edit, :update, :destroy] do
      resources :votes, only: [:create, :update, :destroy]
    end
  end
  resources :votes, only: [:create, :update, :destroy]
  resources :reviews, only: [:edit, :update, :destroy]
  devise_for :users
  root 'ruby_gems#index'
end
