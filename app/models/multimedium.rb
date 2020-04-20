class Multimedium < ApplicationRecord
  belongs_to :Event
  validates :event_id, presence:true
end
