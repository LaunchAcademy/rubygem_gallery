Rails.application.routes.draw do
  devise_for :users
  root 'ruby_gems#index'
end
