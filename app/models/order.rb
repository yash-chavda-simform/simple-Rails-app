class Order < ApplicationRecord
  enum status: { booked: 0, cancelled: 1 }
  belongs_to :query_product
  belongs_to :customer
  
  def total_price
    quantity * query_product.price
  end

  def self.filter_options
    select(:status).distinct
  end

  def self.get_orders(params)
    if params[:filter].present?  
      includes(:customer,:query_product).where(status:params[:filter])
    elsif params[:product_name].present?
      @product = QueryProduct.find_by(title: params[:product_name].downcase)
      where(query_product_id:@product.id)
    else
      includes(:customer,:query_product) 
    end
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
