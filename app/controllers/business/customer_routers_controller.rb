class Business::CustomerRoutersController < ApplicationController
  before_action :find_customer, only: [ :edit, :update, :delete_customer, :preview]
  def index
    @customers = CustomerRouter.all
  end

  def new
    @customer = CustomerRouter.new
  end
  
  def create
    @customer = CustomerRouter.new(customer_params)
    if @customer.save
      redirect_to business_customer_routers_path	
    end
  end

  def edit; end

  def update
    if @customer.update(customer_params)
      redirect_to business_customer_routers_path	
    end 
  end

  def preview; end
  
  def delete_customer
    @customer.destroy
    redirect_to business_customer_routers_path
  end
  
  def search
    if params[:search].present?
      @customers = CustomerRouter.where("name LIKE ?", "%#{params[:search]}%")
    else
      @customers = CustomerRouter.all
    end
  end

  private
  def customer_params
    params.require(:customer_router).permit(:name, :email)
  end

  def find_customer
    @customer = CustomerRouter.find(params[:id])
  end
end
