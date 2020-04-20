class UserInvitation < ApplicationRecord
  belongs_to :User
  has_one :Event
end
