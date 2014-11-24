Rails.application.routes.draw do
  resources :users
  resources :profiles
  root to: 'visitors#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signin/facebook' => 'sessions#facebook', :as => :facebook_signin
  get '/signin/twitter' => 'sessions#twitter', :as => :twitter_signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
