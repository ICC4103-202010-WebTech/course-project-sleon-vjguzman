class SentMessage < ApplicationRecord
  has_one :User
  validates :user_id, presence:true
end
