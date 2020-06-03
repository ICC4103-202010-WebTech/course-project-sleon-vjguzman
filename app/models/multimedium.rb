class Multimedium < ApplicationRecord
  has_one :Event
  validates :event_id, presence:true
end
