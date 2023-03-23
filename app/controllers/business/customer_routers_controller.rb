class Business::CustomerRoutersController < ApplicationController
  before_action :find_customer, only: [ :edit, :update, :delete_customer, :preview]
  def index
    @customers = Business::CustomerRouter.all
  end 

  def new
    @customer = Business::CustomerRouter.new
  end
  
  def create
    @customer = Business::CustomerRouter.new(customer_params)
    if @customer.save
      root_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @customer.update(customer_params)
      root_path	
    else
      render :edit
    end 
  end

  def preview; end
  
  def delete_customer
    @customer.destroy
    root_path
  end
  
  def search
    if params[:search].present?
      @customers = Business::CustomerRouter.where("name LIKE ?", "%#{params[:search]}%")
    else
      @customers = Business::CustomerRouter.all
    end
  end

  private
  def customer_params
    params.require(:business_customer_router).permit(:name, :email)
  end

  def find_customer
    @customer = Business::CustomerRouter.find(params[:id])
  end

  def root_path
    redirect_to business_customer_routers_path
  end
end
