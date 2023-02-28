class QueryProductsController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]

  def index
    @products = QueryProduct.unscoped.all
  end

  def scoped
    @products = QueryProduct.all
  end

  def show 
    @counts = @product.orders.count
  end
  
  def new
    @product = QueryProduct.new
  end
  
  def create
    @product = QueryProduct.new(product_params)
    if @product.save
      redirect_to query_products_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to query_products_path
    end 
  end

  def destroy
    @product.delete
    redirect_to query_products_path
    end

  def find_id
    @product = QueryProduct.unscoped.find(params[:id])
  end

  private
  def product_params
    params.require(:query_product).permit(:title, :description, :price, :capacity, :is_active, :status)
  end
end
