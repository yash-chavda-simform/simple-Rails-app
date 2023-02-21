class Event < ApplicationRecord
  belongs_to :organizer, class_name: "User"
  has_many :comments
  has_and_belongs_to_many :users, :join_table => :users_events
  belongs_to :category
end
