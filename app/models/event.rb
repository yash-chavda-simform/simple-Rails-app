class Event < ApplicationRecord
  belongs_to :user  
  has_many :enrols
  has_many :users, through: :enrols
  belongs_to :category
end
