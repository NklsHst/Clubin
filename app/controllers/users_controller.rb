class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find, only: [:show]

  def show
  end

   private

  def find
    @user = User.find(params[:id])
  end

end
