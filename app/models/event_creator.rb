class EventCreator < ApplicationRecord
  has_one :Event
  has_one :User
  validates :user_id, presence:true
  validates :event_id, presence:true

end
