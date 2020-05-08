class PagesController < ApplicationController
  def home
    @upcoming_events = Event.where('final_date > "01/01/2020 00:00"')
  end
end
  