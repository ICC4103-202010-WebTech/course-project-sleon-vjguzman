class Notification < ApplicationRecord
  belongs_to :User
  has_one :Event
  validates :event_id, presence:true
  validates :user_id, presence:true

end
