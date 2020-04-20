class Organization < ApplicationRecord
  has_many :Members_List
  has_many :Users, :through => :Members_List
  has_many :Events
end
