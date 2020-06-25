class ApplicationController < ActionController::Base
  protected
  def record_user_activity
    if current_user
      current_user.touch :last_active_at
    end
  end
  #def current_user
  # if current_user
  #   current_user
  # elsif current_admin
  #   current_admin
  # else
  #   User.new
  # end
  #end
end

