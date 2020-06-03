class Search < ApplicationRecord

  def users
    @users ||= find_users
  end

  def events
    @events ||= find_events
  end

  private
  def find_users
    @users = User.order(:name)
    @users= users.where("full_name like?", "%#{keywords}%") if keywords.present?
    @users = users.where("username like ?", "%#{keywords}%") if keywords.present?
  end

  def find_events

  end
end
