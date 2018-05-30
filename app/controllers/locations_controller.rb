class LocationsController < ApplicationController

before_action :authenticate_user!, :except => [:index, :show]
before_action :find, only: [:show] #gets right location from params[:id]


  def index
    @locations = Location.all

    @markers = @locations.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude,
        # infoWindow: { content: render_to_string(partial: "/locations/map_box", locals: { flat: flat }) }
        label: location.calculate_average_atmosphere.to_s
      }
    end
  end

  def index_atmosphere
    @locations = Location.all

    @locations.each do |location|
      location.atmosphere_rating = location.calculate_average_atmosphere
    end

    @locations.sort_by! do |location| #note the exclamation mark
    location[:atmosphere_rating]
    end
  end

  def show
    @location
  end

  private

  def find
    @location = Location.find(params[:id])
  end

end
