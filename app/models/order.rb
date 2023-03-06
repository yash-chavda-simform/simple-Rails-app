class Order < ApplicationRecord
  enum status: { booked: 0, cancelled: 1 }
  belongs_to :query_product
  belongs_to :customer
  def query_product
    QueryProduct.unscoped { super }
  end

  def self.most_sales_product_by_quantity
    group(:customer_id)
      .order('SUM(quantity) desc')
      .select('customer_id','SUM(quantity) As total_quantity')
      .first(3)
  end

  def self.status_booked 
    group(:customer_id)
      .order('COUNT(status) desc')
      .select('customer_id','COUNT(customer_id) As total_booked')
      .where(status:"booked")
      .first(5)
  end

  def self.status_cancelled 
    group(:customer_id)
      .order('COUNT(status) desc')
      .select('customer_id','COUNT(customer_id) As total_cancelled')
      .where(status:"cancelled")
      .first(5)
  end 
end
