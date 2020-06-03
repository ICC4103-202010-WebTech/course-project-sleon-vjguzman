class Vote < ApplicationRecord
  has_one :Event
  has_one :User
  validates :guest_list_id, presence:true
  validates :event_dates_id, presence:true
end
