class UserInvitation < ApplicationRecord
  belongs_to :User
  has_one :Event
  validates :user_id, presence:true
  validates :event_id, presence:true

end
