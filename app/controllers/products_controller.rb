class ProductsController < ApplicationController

  before_action :find_id, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show; end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to root_path
    end 
  end

  def destroy
    @product.delete
    redirect_to root_path, status: :see_other
  end

  def find_id
    @product = Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:name, :price)
  end
end
