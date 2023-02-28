class Order < ApplicationRecord
  enum status: { booked: 0, cancelled: 1 }
  belongs_to :query_product
  belongs_to :customer
  def query_product
    QueryProduct.unscoped { super }
  end
end
