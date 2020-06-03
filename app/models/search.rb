class Search < ApplicationRecord

  def users
    @users ||= find_users
  end

  def organizations_name
    @organizations_name ||= find_organizations
  end

  def events_title
    @events_title ||= find_events_title
  end


  private
  def find_users
    users = User.order(:full_name)
    users = User.where("full_name LIKE ? OR username LIKE ?", "%#{keywords}%", "%#{keywords}%") if keywords.present?
  end


  def find_organizations
    organizations_name = Organization.order(:name)
    organizations_name = Organization.where("name like? or description like?", "%#{keywords}%", "%#{keywords}%") if keywords.present?
  end

  def find_events_title
    events_title = Event.order(:title)
    events_title = Event.where("title like? or description like?","%#{keywords}%","%#{keywords}%") if keywords.present?
  end

end
