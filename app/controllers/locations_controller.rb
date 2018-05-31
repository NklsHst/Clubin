class LocationsController < ApplicationController

before_action :authenticate_user!, :except => [:index, :show, :index_atmosphere, :index_queue]
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
    @locations = Location.all.sort_by {|location| location.calculate_average_atmosphere}.reverse.first(10)
  end

  def index_queue
    @locations = Location.all.sort_by {|location| location.calculate_average_queue}.reverse.first(10)
  end

  def show
    @location
  end

  private

  def find
    @location = Location.find(params[:id])
  end

end
