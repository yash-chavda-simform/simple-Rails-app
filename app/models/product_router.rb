class ProductRouter < ApplicationRecord
  has_many :order_routers
  default_scope { order(:id) }  
end
