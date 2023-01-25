class ProductsController < ApplicationController
  def index
    @products=Product.all
  end

  def show
    find_id 
  end
  
  def new
    @product=Product.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    end
  end

  def edit
    find_id  
  end

  def update
    find_id
    if @product.update(product_params)
      redirect_to root_path
    end 
  end

  def destroy
    find_id
    @product.delete
    redirect_to root_path, status: :see_other
  end

  def find_id
    @product=Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:name, :price)
  end
end
