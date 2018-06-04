Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get "users/me/", to: "users#show", as: :profile

  root to: 'locations#index'
  # root to: 'locations#index', as: :locations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Routes for location controller
  get '/locations', to: 'locations#index', as: :locations
  get '/locations/atmosphere', to: 'locations#index_atmosphere', as: :index_atmosphere
  get '/locations/queue', to: 'locations#index_queue', as: :index_queue
  get '/locations/:id', to: 'locations#show', as: :location

  #Routes for checkin controller
  get '/checkin', to: 'checkins#new', as: :checkins_new
  post '/checkin/create', to: 'checkins#create', as: :checkins_create

  get '/checkin/:checkin_id/evaluation', to: 'checkins#evaluation', as: :checkins_evaluation
  patch '/checkin/:checkin_id/edit', to: 'checkins#update'

  get '/checkins/friends', to: 'checkins#index_friends', as: :checkins_friends
  get '/checkins/partypeople', to: 'checkins#index_partypeople', as: :checkins_partypeople
  get '/locations/:id/checkins', to: 'checkins#index_locations', as: :checkins_location

  #Routes for messages controller
  resources :conversations do
    resources :messages
  end

  resources :geolocated_clubs, only: :index

  # post '/geolocated_clubs/:params', to: 'geolocated_clubs#update_location'

  #Routes for third party authentification management
  resources :authentications, only: [:destroy]

end
