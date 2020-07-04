class ApplicationController < ActionController::Base
  before_action :configure_devise_params, if: :devise_controller?
  after_action :record_user_activity

  protected
  def record_user_activity
    if current_user
      current_user.update_attribute(:last_active_at, Time.now)
    end
  end
  def configure_devise_params
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:username,:full_name, :short_bio, :email, :password, :password_confirmation, :location)
    end
  end

end

