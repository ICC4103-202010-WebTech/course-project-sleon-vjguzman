class Organization < ApplicationRecord
  has_many :Members_Lists, dependent: :destroy
  has_many :Users, :through => :Members_List
  has_many :Events, dependent: :destroy
  has_one_attached :banner
end
