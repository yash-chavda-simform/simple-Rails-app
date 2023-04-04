class ProductRenderingsController < ApplicationController
  before_action :authenticate_user_rendering!
  layout :set_layout
  before_action :check_access, except: [:index]
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  
  def index
    @products = ProductRendering.all
  end

  def show; end
  
  def new
    @product = ProductRendering.new
  end
  
  def create
    @product = ProductRendering.new(product_params)
    if @product.save
      root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      root_path
    else
      render :new, status: :unprocessable_entity
    end 
  end

  def destroy
    @product.delete
    root_path
  end

  private
  def product_params
    params.require(:product_rendering).permit(:name, :price)
  end

  def find_product
    @product = ProductRendering.find(params[:id])
  end

  def root_path
    redirect_to product_renderings_path
  end
end
