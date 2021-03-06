class Event < ApplicationRecord
  validates :choice_of_date_id, presence:true
  validates :privacy_id, presence:true
  has_one_attached :banner_picture
  has_many_attached :images
  has_many_attached :files
  has_many_attached :videos
end
