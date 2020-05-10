class Comment < ApplicationRecord
  has_one :User
  has_one :Event
  validates :event_id, presence:true
  validates :user_id, presence:true

end
