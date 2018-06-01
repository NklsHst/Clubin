class CheckinsController < ApplicationController
  before_action :set_location, only: [:new, :create]

  def new
    @checkin = CheckIn.new
  end

  def create
    @checkin = CheckIn.new(checkin_params)
    @checkin.location = @location
    @checkin.user = current_user
    @checkin.save

    redirect_to checkins_evaluation_path(@location, @checkin)
  end

  def evaluation
    @checkin = CheckIn.find(params[:checkin_id])
  end

  def update
     @checkin = CheckIn.find(params[:checkin_id])
     @checkin.update(checkin_params)
     @checkin.save

     redirect_to checkins_final_path(@location, @checkin)
  end

  def final
    @checkin = CheckIn.find(params[:checkin_id])
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def checkin_params
    params.require(:check_in).permit(:latitude, :longitude, :atmosphere_rating, :queue_rating)
  end

end
