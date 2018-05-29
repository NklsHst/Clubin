Rails.application.routes.draw do
  devise_for :users
  root to: 'locations#index', as: :locations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#Routes for loaction controller
# get '/locations', to: 'locations#index', as: :locations
get '/locations/atmosphere', to: 'locations#index_atmosphere', as: :index_atmosphere
get '/locations/queue', to: 'locations#index_queue', as: :index_queue
get '/locations/:id', to: 'locations#show', as: :location

#Routes for checkin controller
get '/locations/:id/checkin-new', to: 'checkins#new', as: :checkins_new
post '/locations/:id/checkin-create', to: 'checkins#create', as: :checkins_create
get '/checkins/friends', to: 'checkins#index_friends', as: :checkins_friends
get '/checkins/partypeople', to: 'checkins#index_partypeople', as: :checkins_partypeople
get '/locations/:id/checkins', to: 'checkins#index_locations', as: :checkins_location

#Routes for messages controller
#To be done have to think about how we set up the chat function
end
