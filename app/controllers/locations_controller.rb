class LocationsController < ApplicationController

before_action :authenticate_user!
before_action :find, only: [:show] #gets right location from params[:id]


  def index
    @locations = Location.all

    @markers = @locations.map do |location|
      next if location.latitude.nil? || location.longitude.nil?
      {
        lat: location.latitude,
        lng: location.longitude,
        # label: "#{location.calculate_average_atmosphere.to_s}/#{location.calculate_average_queue.to_s}",
        infoWindow: { content: render_to_string(partial: "/locations/map_box", locals: { location: location }) }
      }
    end
    @markers = @markers.compact
  end

  def index_atmosphere
    @locations = Location.all.sort_by {|location| location.calculate_average_atmosphere}.reverse.first(10)
  end

  def index_queue
    @locations = Location.all.sort_by {|location| location.calculate_average_queue}.reverse.first(10)
  end

  def show
    @checkin_users = @location.users
    @checkin_friends = @location.users.joins("LEFT OUTER JOIN friendships ON friendships.partner_id = users.id ").where('friendships.user_id = ?', current_user.id)
    @checkin_strangers = @location.users - @checkin_friends - [current_user]

    @markers = []
    @marker =
      {
        lat: @location.latitude,
        lng: @location.longitude,
        # label: "#{location.calculate_average_atmosphere.to_s}/#{location.calculate_average_queue.to_s}",
        infoWindow: { content: render_to_string(partial: "/locations/map_box_two", locals: { location: location }) }
      }
    @markers << @marker
  end


  private

  def find
    @location = Location.find(params[:id])
  end

  def friend_count(location)
    location.users.joins("LEFT OUTER JOIN friendships ON friendships.partner_id = users.id ").where('friendships.user_id = ?', current_user.id)
  end

end
