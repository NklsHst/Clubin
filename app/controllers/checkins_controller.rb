class CheckinsController < ApplicationController
  # before_action :set_location, only: [:new, :create]

  # for feed of CheckIns --> not tested yet
  # def show
  #   @all_checkins = CheckIn.all

  #   @friends_checkins = []
  #   @strangers_checkins = []

  #   user_partner_ids = []
  #   current_user.friendships.each do |friendship|
  #     user_partner_ids << friendship.partner_id
  #   end

  #   @all_checkins.each do |check_in|
  #     if user_partner_ids.include? check_in.user_id
  #       # use next line instead of the one above for time logic (set the time frame for checkins to 3 hours)
  #       # if user_partner_ids.include? check_in.user_id && Time.nom.utc - check_in.created_at < 1080
  #       @friends_checkins << check_in
  #     else
  #       # use next line instead of the one above for time logic (set the time frame for checkins to 3 hours)
  #       # elsif  Time.nom.utc - check_in.created_at > 1080
  #       @strangers_checkins << check_in
  #     end
  #   end
  # end

  def new
    @checkin = CheckIn.new
  end

  def create
    @checkin = CheckIn.new(checkin_params)
    @checkin.user = current_user

    if @location.geocoded? && @checkin.geocoded?
      @checkin.save

      redirect_to checkins_evaluation_path(@location, @checkin)
    else
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
    params.require(:check_in).permit(:location_id, :latitude, :longitude, :atmosphere_rating, :queue_rating)
  end

end
