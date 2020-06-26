class Event < ApplicationRecord
  has_one :choice_of_date
  has_one :privacy
  has_many :Reports, dependent: :destroy
  has_many :Comments, dependent: :destroy
  has_many :Multimedium, dependent: :destroy
  has_many :Guest_Lists, dependent: :destroy
  has_many :Users
  has_one :Event_Creator, dependent: :destroy
  has_one :organization
  has_many :Notifications, dependent: :destroy
  validates :choice_of_date_id, presence:true
  validates :privacy_id, presence:true
  validates :organization_id, presence:true
  has_one_attached :banner_picture
  has_many_attached :images
  has_many_attached :files
  has_many_attached :videos
end
