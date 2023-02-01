class Author < ApplicationRecord
  validates :email, uniqueness: true
  validates :first_name,:last_name,:email, presence:true
  has_many :books
  has_many :images, as: :imageable
end
