class OrdersController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]

  def index
    fetch_data
    @filters = Order.select(:status).distinct

    if params[:product_id].present?
      @orders = Order.includes(:customer).where(query_product_id:params[:product_id])  
    elsif params[:filter].present?
      @orders = Order.includes(:customer).where(status:params[:filter])
    elsif params[:product_name].present?
      @product = QueryProduct.find_by(title: params[:product_name].downcase)
      @orders = Order.where(query_product_id:@product.id)
    else
      @orders = Order.includes(:customer) 
    end
  end

  def show; end
  
  def new
    @order = Order.new
    fetch_data
  end
  
  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit 
    fetch_data
  end

  def update
    if @order.update(order_params)
      redirect_to orders_path
    end 
  end

  def destroy
    @order.delete
    redirect_to orders_path
    end

  def find_id
    @order = Order.find(params[:id])
  end

  def fetch_data
    @products = QueryProduct.unscoped.all
    @customers = Customer.all
  end

  def result
    @top_products = 
      Order
        .group(:customer_id)
        .order('SUM(quantity) desc')
        .select('customer_id','SUM(quantity) As total_quantity')
        .first(3)
    @top_prices = 
      Customer
        .joins(:query_products)
        .group('customers.id')
        .select('customers.first_name','SUM(query_products.price) As total_price')
        .order('SUM(query_products.price) desc')    
        .first(3)
    @booked_customers = 
      Order
        .group(:customer_id)
        .order('COUNT(status) desc')
        .select('customer_id','COUNT(customer_id) As total_booked')
        .where(status:"booked")
        .first(5)
    @cancelled_customers = 
      Order
        .group(:customer_id)
        .order('COUNT(status) desc')
        .select('customer_id','COUNT(customer_id) As total_cancelled')
        .where(status:"cancelled")
        .first(5)
  end

  private
  def order_params
    params.require(:order).permit(:quantity, :status, :query_product_id, :customer_id)
  end 
end
