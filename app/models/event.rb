class Event < ApplicationRecord
  has_one :Choice_Of_Date
  has_one :Privacy
  has_many :Report
  has_many :Comments
  has_many :Multimedia
  has_many :Guest_List
  has_and_belongs_to_many :Users
  has_one :Event_Creator
  has_one :Organization
  has_many :Notifications

end
