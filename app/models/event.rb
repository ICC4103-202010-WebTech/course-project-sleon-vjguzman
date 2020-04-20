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
  validates :choice_of_date, presence:true
  validates :privacy_type, presence:true
  validates :organization_id, presence:true


end
