class Customer < ApplicationRecord
  has_many :orders
  validates :email, presence: true
  validates :email, uniqueness: true    
end
