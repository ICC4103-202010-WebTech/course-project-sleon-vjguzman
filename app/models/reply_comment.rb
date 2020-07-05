class ReplyComment < ApplicationRecord
  has_one :comment
  has_one :user
  has_one :event
end
