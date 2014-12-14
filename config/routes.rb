Rails.application.routes.draw do
  resources :videos

  resources :users
  resources :profiles
  resources :twitter
  resources :videos
  root to: 'visitors#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signin/facebook' => 'sessions#facebook', :as => :facebook_signin
  get '/signin/twitter' => 'sessions#twitter', :as => :twitter_signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
  get "/pages/*id" => 'pages#show', as: :page, format: false
end
