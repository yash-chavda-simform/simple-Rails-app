class OrdersController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show; end
  
  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

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

  private
  def order_params
    params.require(:order).permit(:quantity, :status)
  end 
end
