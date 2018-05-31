class CheckinsController < ApplicationController
  before_action :set_location, only: [:new, :create]

  def new
    @checkin = CheckIn.new
  end

  def create
    @checkin = CheckIn.new(checkin_params)
    @checkin.location = @location
    @checkin.user = current_user

    if @location.geocoded? && @checkin.geocoded? && (@location.distance_from(@checkin) < 0.186411)
      @checkin.save

      redirect_to checkins_evaluation_path(@location, @checkin)
    else
      flash[:alert] = "You need to be within a radius of 300 meters of the location to check in."
      redirect_to checkins_new_path(@location)
    end
  end

  def evaluation
  end

  def update
     @checkin = CheckIn.find(params[:checkin_id])
     @checkin.update(checkin_params)
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def checkin_params
    params.require(:check_in).permit(:latitude, :longitude, :atmosphere_rating, :queue_rating)
  end

end
