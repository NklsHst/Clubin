class CheckinsController < ApplicationController
  before_action :set_location, only: [:create]

  def index
    @all_checkins = CheckIn.all.where.not(user_id: current_user.id)
    @friends_checkins = []
    @strangers_checkins = []

    user_partner_ids = []
    current_user.friendships.each do |friendship|
      user_partner_ids << friendship.partner_id
    end

    @all_checkins.each do |check_in|
      if user_partner_ids.include? check_in.user_id
        # use next line instead of the one above for time logic (set the time frame for checkins to 3 hours)
        # if user_partner_ids.include? check_in.user_id && Time.nom.utc - check_in.created_at < 1080
        @friends_checkins << check_in
      else
        # use next line instead of the one above for time logic (set the time frame for checkins to 3 hours)
        # elsif  Time.nom.utc - check_in.created_at > 1080
        @strangers_checkins << check_in
      end
    end
    @all_checkins.reverse
    @friends_checkins.reverse
    @strangers_checkins.reverse
  end

  def new
    @checkin_timeframe = 12.hours.ago

    @checkin_last = CheckIn.where(user: current_user).where("created_at > ?", @checkin_timeframe)
    @checkin = CheckIn.new

    if @checkin_last.first
      flash.now[:alert] = "You are already checked in at #{@checkin_last.first.location.name}. You can still check in here but be aware that you will loose your old checkin."
    end
  end

  def create
    @checkin = CheckIn.new(checkin_params)
    @checkin.user = current_user
    @location = Location.find(params[:check_in][:location_id]) unless params[:check_in][:location_id].nil?

    if @location.geocoded? && @checkin.geocoded?
      @checkin.save

      redirect_to checkins_evaluation_path(@location, @checkin)
    else
      redirect_to checkins_new_path(@location)
    end
  end

  def evaluation
    @checkin = CheckIn.find(params[:checkin_id])
  end

  def update
     @location = Location.find(params[:id]) unless params[:id].nil?
     @checkin = CheckIn.find(params[:checkin_id])
     @checkin.update(checkin_params)
     @checkin.save

     redirect_to checkins_final_path(@location, @checkin)
  end

  def final
    @checkin = CheckIn.find(params[:checkin_id])

    @all_checkins = CheckIn.all.where.not(user_id: current_user.id).where(location_id: params[:id])
    @friends_checkins = []
    @strangers_checkins = []

    user_partner_ids = []
    current_user.friendships.each do |friendship|
      user_partner_ids << friendship.partner_id
    end

    @all_checkins.each do |check_in|
      if user_partner_ids.include? check_in.user_id
        # use next line instead of the one above for time logic (set the time frame for checkins to 3 hours)
        # if user_partner_ids.include? check_in.user_id && Time.nom.utc - check_in.created_at < 1080
        @friends_checkins << check_in
      else
        # use next line instead of the one above for time logic (set the time frame for checkins to 3 hours)
        # elsif  Time.nom.utc - check_in.created_at > 1080
        @strangers_checkins << check_in
      end
    end


  end

  private

  def set_location
    # @location = Location.find(params[:id])
    @location = Location.find(params[:check_in][:location_id]) unless params[:check_in][:location_id].nil?
  end

  def checkin_params
    params.require(:check_in).permit(:location_id, :latitude, :longitude, :atmosphere_rating, :queue_rating)
  end

end
