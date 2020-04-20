class EventDate < ApplicationRecord
  has_one :Event
  validates :event_id, presence:true
  validates :date, presence:true

end
