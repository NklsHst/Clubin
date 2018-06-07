class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    unless current_user
      find
    else
      redirect_to root_path
    end
  end

   private

  def find
    @user = User.find(params[:id])
  end

end
