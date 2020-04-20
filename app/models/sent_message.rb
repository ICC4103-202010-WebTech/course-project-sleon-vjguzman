class SentMessage < ApplicationRecord
  belongs_to :User
  validates :user_id, presence:true
end
