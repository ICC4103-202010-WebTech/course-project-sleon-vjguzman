class MembersList < ApplicationRecord
  has_many :User
  belongs_to :Organization
end
