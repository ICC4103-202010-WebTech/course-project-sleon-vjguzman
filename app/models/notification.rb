class Notification < ApplicationRecord
  belongs_to :User
  has_one :Event
end
