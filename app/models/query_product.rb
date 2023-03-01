class QueryProduct < ApplicationRecord
  has_many :orders
  has_many :customers, through: :orders
  default_scope { where(is_active: true) }
  enum status: { InStock:0, OutOfStock:1, CommingSoon:2 }
end
