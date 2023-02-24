class QueryProduct < ApplicationRecord
  enum status: { InStock:0, OutOfStock:1, CommingSoon:2 }
  has_many :orders
end
