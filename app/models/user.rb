class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end


class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :Notifications
  has_one :User_Administration
  has_many :Event_Creators
  has_and_belongs_to_many :Events
  has_many :Reports
  has_many :Members_Lists
  has_many :Organizations, :through => :Members_Lists
  has_many :Mail_Boxes
  has_many :Sent_Messages
  has_many :User_Invitations
  has_many :Comments
  has_many :Guest_Lists
  has_one :System_Admin
  validates :email, presence: true, uniqueness: true, email: true
  validates :username, presence: true, uniqueness: true
  has_one_attached :profile_picture

end



