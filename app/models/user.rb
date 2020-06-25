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
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :Notifications, dependent: :destroy
  has_one :User_Administration, dependent: :destroy
  has_many :Event_Creators, dependent: :destroy
  has_many :Events
  has_many :Reports, dependent: :destroy
  has_many :Members_Lists, dependent: :destroy
  has_many :Organizations, :through => :Members_Lists
  has_many :Mail_Boxes, dependent: :destroy
  has_many :Sent_Messages, dependent: :destroy
  has_many :User_Invitations, dependent: :destroy
  has_many :Comments, dependent: :destroy
  has_many :Guest_Lists, dependent: :destroy
  has_one :System_Admin, dependent: :destroy
  validates :email, uniqueness: true, email: true
  validates :username,uniqueness: true
  has_one_attached :profile_picture
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
     unless user
         user = User.create(name: data['name'],
           email: data['email'],
           password: "salchipapas",
         )
     end
    user
  end
end



