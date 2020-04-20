class Vote < ApplicationRecord
  has_one :Event
  has_one :User
end
