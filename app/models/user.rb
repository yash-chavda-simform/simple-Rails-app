class User < ApplicationRecord
  has_many :organized_event, foreign_key:"organizer_id", class_name: "Event"
  has_many :comments
  has_and_belongs_to_many :events, :join_table => :users_events
  has_one :address, :as => :addressable
  has_secure_password
  validates :email,:password, presence: true
  validates :email, uniqueness: true
end
