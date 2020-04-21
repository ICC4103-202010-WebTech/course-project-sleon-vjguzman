class GuestList < ApplicationRecord
  has_one :Event
  has_many :Users
  validates :user_id, presence:true
  validates :event_id, presence:true

end
