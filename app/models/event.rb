class Event < ApplicationRecord
  has_one :choice_of_date
  has_one :privacy
  has_many :reports, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :multimedium, dependent: :destroy
  has_many :guest_lists, dependent: :destroy
  has_many :users
  has_one :event_creator, dependent: :destroy
  has_one :organization
  has_many :notifications, dependent: :destroy
  has_many :event_dates, dependent: :destroy
  has_many :user_invitations, dependent: :destroy
  validates :choice_of_date_id, presence:true
  validates :privacy_id, presence:true
  has_one_attached :banner_picture
  has_many_attached :images
  has_many_attached :files
  has_many_attached :videos
end
