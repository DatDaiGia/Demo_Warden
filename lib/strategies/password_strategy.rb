class PasswordStrategy < ::Warden::Strategies::Base

  def valid?
    return false if request.get?
    user_data = params.fetch("session", {})
    (user_data["email"]&&user_data["password"]).present? || authentication_token.present?
  end

  def authenticate!
    if authentication_token
      user = User.find_by_authentication_token authentication_token
      user.nil? ? fail!() : success!(user)
    else
      user = User.find_by_email params["session"]["email"]
      if user.nil? || user.password != params["session"]["password"]
        fail!()
      else
        success! user
      end
    end
  end

  private
  def authentication_token
    params["authentication_token"]
  end
end
