class Report < ApplicationRecord
  belongs_to :User
  belongs_to :Event
  validates :user_id, presence:true
  validates :event_id, presence:true

end
