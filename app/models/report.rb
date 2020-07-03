class Report < ApplicationRecord
  has_one :User
  has_one :Event
end
