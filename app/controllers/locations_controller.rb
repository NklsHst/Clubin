class LocationsController < ApplicationController

before_action :authenticate_user!, :except => [:index, :show]
before_action :find, only: [:show] #gets right location from params[:id]


  def index
    @locations = Location.all
  end



  def show
    @location
  end

  private

  def find
    @location = Location.find(params[:id])
  end

end
