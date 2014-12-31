Rails.application.routes.draw do
  resources :users
  resources :profiles
  resources :twitter
  resources :videos
  root to: 'visitors#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/profiles/:id/authorize_facebook' => 'profiles#authorize_facebook', :as => :profiles_authorize_facebook
  get '/profiles/:id/facebook_oauth_code' => 'profiles#facebook_oauth_code'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signin/facebook' => 'sessions#facebook', :as => :facebook_signin
  get '/signin/twitter' => 'sessions#twitter', :as => :twitter_signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
  get "/pages/*id" => 'pages#show', as: :page, format: false
end
