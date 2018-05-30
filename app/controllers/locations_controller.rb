class LocationsController < ApplicationController

before_action :authenticate_user!, :except => [:index, :show]
before_action :find, only: [:show] #gets right location from params[:id]


  def index
    @locations = Location.all

    @markers = @locations.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude,
        # label: "#{location.calculate_average_atmosphere.to_s}/#{location.calculate_average_queue.to_s}",
        infoWindow: { content: render_to_string(partial: "/locations/map_box", locals: { location: location }) }
      }
    end
  end

  def index_atmosphere
    @locations = Location.all.sort_by {|location| location.calculate_average_atmosphere}.reverse.first(5)
  end

  def index_queue
    @locations = Location.all.sort_by {|location| location.calculate_average_queue}.reverse.first(5)
  end

  def show
    @location
  end

  private

  def find
    @location = Location.find(params[:id])
  end

end
