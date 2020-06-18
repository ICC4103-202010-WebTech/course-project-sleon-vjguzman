class Report < ApplicationRecord
  has_one :User
  has_one :Event
  validates :user_id, presence:true
  validates :event_id, presence:true
end
