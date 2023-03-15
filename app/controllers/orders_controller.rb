class OrdersController < ApplicationController
  before_action :find_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.get_orders(params)
  end

  def show; end
  
  def new
    @order = Order.new
    set_product_customers
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
    set_product_customers
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

  def query_result; end

  private
  def order_params
    params.require(:order).permit(:quantity, :status, :query_product_id, :customer_id)
  end

  def find_order
    @order = Order.find(params[:id])
  end

  def set_product_customers
    @products = QueryProduct.all
    @customers = Customer.all
  end
end
