class Event < ApplicationRecord
  has_one :Choice_Of_Date
  has_one :Privacy
  has_many :Reports, dependent: :destroy
  has_many :Comments, dependent: :destroy
  has_many :Multimedium, dependent: :destroy
  has_many :Guest_Lists, dependent: :destroy
  has_and_belongs_to_many :Users
  has_one :Event_Creator, dependent: :destroy
  has_one :Organization
  has_many :Notifications, dependent: :destroy
  validates :choice_of_date_id, presence:true
  validates :privacy_id, presence:true
  validates :organization_id, presence:true

end
