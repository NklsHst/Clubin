class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    begin
      find
    rescue Exception => e
      redirect_to root_path
    end
  end

   private

  def find
    @user = User.find(params[:id])
  end

end
