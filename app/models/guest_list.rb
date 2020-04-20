class GuestList < ApplicationRecord
  belongs_to :Event
  has_many :User
end
