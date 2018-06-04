class GeolocatedClubsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: :index

  def index

    max_distance = 0.3
    coords = [params[:lat], params[:lng]]
    locations = Location.near(coords, 2, :units => :km)
    locations_sorted = locations.sort_by { |l| Geocoder::Calculations.distance_between(l, coords) }
    final_location = ["Not close to any clubs"]
    final_location = locations_sorted.first if Geocoder::Calculations.distance_between(locations_sorted.first, coords) <= max_distance

    render json: final_location
  end
end



