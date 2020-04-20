class MembersList < ApplicationRecord
  has_many :User
  belongs_to :Organization
  validates :user_id, presence:true
  validates :organization_id, presence:true
  validates :user_role, presence:true

end
