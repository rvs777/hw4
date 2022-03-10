Rails.application.routes.draw do
  resources :sessions
  resources :users
  resources :places
  resources :posts
  resources :sessions
  root to: "places#index"
end
