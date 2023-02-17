class User < ApplicationRecord
  # has_many :events
  has_many :enrols
  has_many :events, through: :enrols
  has_one :address, :as => :addressable
  has_secure_password
  validates :email,:password, presence: true
  validates :email, uniqueness: true
end
