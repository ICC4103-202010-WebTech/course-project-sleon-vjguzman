class Event < ApplicationRecord
  has_one :choice_of_date_id
  has_one :privacy_id
  has_many :Reports, dependent: :destroy
  has_many :Comments, dependent: :destroy
  has_many :Multimedium, dependent: :destroy
  has_many :GuestLists, dependent: :destroy
  has_many :Users
  has_one :EventCreator, dependent: :destroy
  has_one :Organization
  has_many :Notifications, dependent: :destroy
  has_many :EventDates, dependent: :destroy
  has_many :UserInvitations, dependent: :destroy
  validates :choice_of_date_id, presence:true
  validates :privacy_id, presence:true
  has_one_attached :banner_picture
  has_many_attached :images
  has_many_attached :files
  has_many_attached :videos
end
