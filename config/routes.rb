Rails.application.routes.draw do
  resources :ruby_gems do
    resources :reviews, only: :create
  end

  devise_for :users
  root 'ruby_gems#index'
end
