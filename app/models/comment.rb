class Comment < ApplicationRecord
  has_many :Users
  has_many :Events
  validates :event_id, presence:true
  validates :user_id, presence:true

end
