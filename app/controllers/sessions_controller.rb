class SessionsController < ApplicationController

  def create
    authenticate!
    redirect_to current_user
  end

  def destroy
    warden.logout
    redirect_to new_sessions_path
  end
end
