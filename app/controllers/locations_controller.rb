class LocationsController < ApplicationController

before_action :authenticate_user!
# before_action :find, only: [:show] #gets right location from params[:id]


  def index

    @locations = Location.all

    @markers = @locations.map do |location|
      next if location.latitude.nil? || location.longitude.nil?
      {
        lat: location.latitude,
        lng: location.longitude,
        #label: "#{location.calculate_average_atmosphere.to_s}/#{location.calculate_average_queue.to_s}",
        icon: ActionController::Base.helpers.asset_path("pin.png"),
        infoWindow: { content: render_to_string(partial: "/locations/map_box", locals: { location: location }) }
      }
    end
    @markers = @markers.compact
  end

  def index_atmosphere
    @locations = Location.all.sort_by {|location| location.calculate_average_atmosphere}.reverse
  end

  def index_queue
    @locations = Location.all.sort_by {|location| location.calculate_average_queue}.reverse
  end

  def show

    if params[:query].present?
      @location = Location.search_by_name(params[:query])[0]
    else
      @location = Location.find(params[:id])
    end



    if @location.nil?
      redirect_to redirect_path
      return
    end


    @checkin_users = @location.users
    @checkin_friends = @location.users.joins("LEFT OUTER JOIN friendships ON friendships.partner_id = users.id ").where('friendships.user_id = ?', current_user.id)
    @checkin_strangers = @location.users - @checkin_friends - [current_user]


    @markers = []
    @marker =
      {
        lat: @location.latitude,
        lng: @location.longitude,
        # label: "#{location.calculate_average_atmosphere.to_s}/#{location.calculate_average_queue.to_s}",
        infoWindow: { content: render_to_string(partial: "/locations/map_box_two", locals: { location: location }) },
        icon: ActionController::Base.helpers.asset_path('pin.png')
      }
    @markers << @marker
  end

  def search
      # # @location = Location.where(name: params[:query])[0] if params[:query].present?
      # redirect_to locations_path if @location.nil?
  end

  private

  # def find
  #   @location = Location.find(params[:id])
  # end

  def friend_count(location)
    location.users.joins("LEFT OUTER JOIN friendships ON friendships.partner_id = users.id ").where('friendships.user_id = ?', current_user.id)
  end

end
