Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get "users/:id", to: "users#show", as: :profile

  root to: 'locations#index'
  # root to: 'locations#index', as: :locations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Routes for location controller
  get '/locations', to: 'locations#index', as: :locations
  get '/locations/atmosphere', to: 'locations#index_atmosphere', as: :index_atmosphere
  get '/locations/queue', to: 'locations#index_queue', as: :index_queue
  get '/locations/:id', to: 'locations#show', as: :location
  get '/locations/search', to: 'locations#search', as: :location_search
  get '/redirect', to: 'locations#redirect', as: :redirect

  # Routes for checkin controller
  get '/checkin', to: 'checkins#new', as: :checkins_new
  post '/checkin/create', to: 'checkins#create', as: :checkins_create
  patch '/locations/:id/checkin/:checkin_id/edit', to: 'checkins#update', as: :checkins_update
  get '/locations/:id/checkin/:checkin_id/evaluation', to: 'checkins#evaluation', as: :checkins_evaluation
  get '/locations/:id/checkin/:checkin_id/final', to: 'checkins#final', as: :checkins_final

  get '/checkins/all', to: 'checkins#index', as: :checkins_all
  get '/checkins/partypeople', to: 'checkins#index_partypeople', as: :checkins_partypeople
  get '/locations/:id/checkins', to: 'checkins#index_locations', as: :checkins_location

  # Routes for messages controller
  resources :conversations do
    resources :messages
   end

  # Routes for the geolocation feature of check_in
  resources :geolocated_clubs, only: :index

  # Routes for third party authentification management
  resources :authentications, only: [:destroy]

  get '*path' => redirect('/404')

end
