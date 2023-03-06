class OrderRoutersController < ApplicationController
  before_action :set_product
  before_action :set_order, only: [:edit, :update, :destroy]
  def index
    @orders = @product.order_routers
  end

  def show
    @order = @product.order_routers.find(params[:id])
  end

  def new
    @order = @product.order_routers.new
  end

  def create
    @order = @product.order_routers.build(order_params)
    if @order.save
      redirect_to product_router_order_routers_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @order.update(order_params)
      redirect_to product_router_order_routers_path
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to product_router_order_routers_path
  end

  private
  def order_params
    params.require(:order_router).permit(:quantity)
  end

  def set_product
    @product = ProductRouter.find(params[:product_router_id])
  end

  def set_order
    @order = @product.order_routers.find(params[:id])
  end
end
