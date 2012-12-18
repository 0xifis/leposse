Leposse::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :venues
  resources :games
  resources :search

  match "/about" => "pages#about", as: :about
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get "/games/:id/join" => "games#join", as: :join
  get "/games/:id/leave" => "games#leave", as: :leave
  get "/user/:id/show" => "users#show", as: :user
  get "/users" => "users#index", as: :users
  get "/search/:query" => "searches#show", as: :search


  root to: "pages#home"
end
