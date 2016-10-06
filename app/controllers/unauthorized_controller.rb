class UnauthorizedController < ActionController::Metal
  include ActionController::Redirecting
  include Rails.application.routes.url_helpers

  delegate :flash, to: :request

  class << self
    def call env
      @respond ||= action :respond
      @respond.call env
    end
  end

  def respond
    unless request.get?
      env["warden.options"][:message] = "Logged in fail!"
      flash.alert = env["warden.options"][:message]
    end
    redirect_to new_sessions_url
  end
end
