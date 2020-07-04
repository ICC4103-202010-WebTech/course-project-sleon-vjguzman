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

  has_many :notifications, dependent: :destroy
  has_one :user_administrations, dependent: :destroy
  has_many :event_creators, dependent: :destroy
  has_many :events
  has_many :reports, dependent: :destroy
  has_many :members_lists, dependent: :destroy
  has_many :organizations, :through => :Members_Lists
  has_many :mail_boxes, dependent: :destroy
  has_many :sent_messages, dependent: :destroy
  has_many :user_invitations, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :guest_lists, dependent: :destroy
  has_one :system_admin, dependent: :destroy
  has_many :messages, dependent: :destroy
  validates :email, uniqueness: true, email: true
  validates :username,uniqueness: true
  has_one_attached :profile_picture
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
     unless user
         user = User.create(full_name: data['name'],
           email: data['email'],
           password: data['email']
         )
     end
    user
  end
end



