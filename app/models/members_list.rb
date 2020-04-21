class MembersList < ApplicationRecord
  has_many :Users
  has_many :Organizations
  validates :user_id, presence:true
  validates :user_role, presence:true

end
