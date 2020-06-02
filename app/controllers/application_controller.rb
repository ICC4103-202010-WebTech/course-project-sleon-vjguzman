class ApplicationController < ActionController::Base
  def search
    @users_name = User.where(full_name: params[:full_name])
    @users_username = User.where(username: params[:username])
    @organizations = Organization.where(name: params[:name])
    @events_title = Event.where()
  end
end

