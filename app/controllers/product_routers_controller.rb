class ProductRoutersController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = ProductRouter.all
  end
 
  def show; end
  
  def new
    @product = ProductRouter.new
  end
  
  def create
    @product = ProductRouter.new(product_params)
    if @product.save
      product_index_path
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      product_index_path
    end 
  end

  def destroy
    @product.delete
    redirect_to product_routers_path, status: :see_other
  end

  private
  def product_params
    params.require(:product_router).permit(:name, :price)
  end

  def find_product
    @product = ProductRouter.find(params[:id])
  end

  def product_index_path
    redirect_to product_routers_path
  end
end
