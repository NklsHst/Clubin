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
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def checkin_params
    params.require(:check_in).permit(:latitude, :longitude)
  end

end
