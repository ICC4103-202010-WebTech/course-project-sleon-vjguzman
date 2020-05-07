class PagesController < ApplicationController
  def home
    @upcoming_events = Event.all
  end
end
