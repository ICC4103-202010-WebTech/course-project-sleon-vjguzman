class GuestList < ApplicationRecord
  belongs_to :Event
  has_many :User
  validates :user_id, presence:true
  validates :event_id, presence:true

end
