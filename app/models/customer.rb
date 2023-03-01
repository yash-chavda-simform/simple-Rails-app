class Customer < ApplicationRecord
  has_many :orders
  has_many :query_products, through: :orders
  validates :email, presence: true
  validates :email, uniqueness: true    
end
