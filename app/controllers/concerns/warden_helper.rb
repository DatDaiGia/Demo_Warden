module WardenHelper
  extend ActiveSupport::Concern

  included do
    helper_method :warden, :logged_in?, :current_user
  end

  def logged_in?
    current_user.present?
  end

  def current_user
    warden.user
  end

  def warden
    env['warden']
  end

  def authenticate!
    warden.authenticate! :password_strategy
  end
end
