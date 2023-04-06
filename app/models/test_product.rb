class TestProduct < ApplicationRecord
  belongs_to :user_rendering
  validates :product_name, :price, :description, presence: true
  validates :price, numericality: true
end
