class Order < ApplicationRecord
  enum status: { booked: 0, cancelled: 1 }
  belongs_to :query_product
  belongs_to :customer
end
