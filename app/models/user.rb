class User < ApplicationRecord
  has_many :organized_event, foreign_key:"organizer_id", class_name: "Event"
  has_many :enrols
  has_many :comments
  has_many :events, through: :enrols
  has_one :address, :as => :addressable
  has_secure_password
  validates :email,:password, presence: true
  validates :email, uniqueness: true
end
