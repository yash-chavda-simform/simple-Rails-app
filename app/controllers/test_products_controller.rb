class TestProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user_rendering!
  
  def index
    @products = TestProduct.all
  end

  def show; end
  
  def new
    @product = TestProduct.new
  end
  
  def create
    @product = current_user_rendering.test_products.new(product_params)
    if @product.save
      flash[:success] = "product Created"
      redirect_to test_products_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      flash[:success] = "product Updated"
      redirect_to test_products_path
    else
      render :edit, status: :unprocessable_entity
    end 
  end

  def destroy
    if @product.destroy
      flash[:success] = "product Deleted"
    else
      flash[:danger] = "product Not Deleted"
    end
    redirect_to test_products_path
  end

  private

  def product_params
    params.require(:test_product).permit(:product_name, :price, :description)
  end

  def set_product
    @product = TestProduct.find(params[:id])
  end
end
