class Vote < ApplicationRecord
  has_one :Event
  has_one :User
  validates :list_id, presence:true
  validates :date_id, presence:true

end
