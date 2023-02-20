class Event < ApplicationRecord
  belongs_to :organizer, class_name: "User"
  belongs_to :user  
  has_many :enrols
  has_many :comments
  has_many :users, through: :enrols
  belongs_to :category
end
