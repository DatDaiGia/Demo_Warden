class RegistrationsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:notice] = "Registrations User Success"
      redirect_to new_sessions_path
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password
  end
end
