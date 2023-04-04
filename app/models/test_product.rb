class TestProduct < ApplicationRecord
  belongs_to :test_user
  validates :product_name, :price, :description, presence: true
  validates :price, numericality: true
end
