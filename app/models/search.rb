class Search < ApplicationRecord

  def users
    @users ||= find_users
  end

  private
  def find_users
    users = User.order(:name)
    users_name = users.where("full_name like?", "%#{keywords}%") if keywords.present?
    users_username = users.where("username like ?", "%#{keywords}%") if keywords.present?
  end
end
