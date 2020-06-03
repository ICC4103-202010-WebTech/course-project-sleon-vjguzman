class Search < ApplicationRecord

  def users_fullname
    @users_fullname ||= find_users_fullname
  end

  def users_username
    @users_username ||= find_users_username
  end

  def organizations_name
    @organizations_name ||= find_organizations
  end

  private
  def find_users_fullname
    users_fullname = User.all.order(:full_name) if keywords.present?
    users_fullname = users_fullname.where("full_name like?", "%#{keywords}%") if keywords.present?
  end

  def find_users_username
    users_username= User.all.order(:username)  if keywords.present?
    users_username = users_username.where("username like?", "%#{keywords}%") if keywords.present?
  end

  def find_organizations
    organizations_name = Organization.all.order(:name)  if keywords.present?
    organizations_name = organizations_name.where("name like?", "%#{keywords}%") if keywords.present?
  end
end
