class ApplicationController < ActionController::Base
  protected
  def record_user_activity
    if current_user
      current_user.touch :last_active_at
    end
  end
  def configure_devise_params
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:username,:full_name, :short_bio, :email, :password, :password_confirmation, :location)
    end
  end

  def current_customer
    if current_user
      current_user
    elsif current_admin
      current_admin
    else
      Customer.new
    end
  end
end

