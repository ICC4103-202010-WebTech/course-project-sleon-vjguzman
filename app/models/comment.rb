class Comment < ApplicationRecord
  belongs_to :User
  belongs_to :Event
  validates :event_id, presence:true
  validates :user_id, presence:true

end
