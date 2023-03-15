class Customer < ApplicationRecord
  has_many :orders
  has_many :query_products, through: :orders
  validates :email, presence: true
  validates :email, uniqueness: true    
  
  def full_name
    "#{first_name} #{last_name}"
  end

  def self.most_sales_product_by_price 
    joins(:query_products).group('customers.id')
      .select('customers.first_name','customers.last_name','SUM(query_products.price) As total_price')
      .order('SUM(query_products.price) desc')
      .first(3)
  end 
end
