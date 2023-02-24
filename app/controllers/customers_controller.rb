class CustomersController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.all
  end

  def show; end
  
  def new
    @customer = Customer.new
  end
  
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @customer.update(customer_params)
      redirect_to customers_path
    end 
  end

  def destroy
    @customer.delete
    redirect_to customers_path
    end

  def find_id
    @customer = Customer.find(params[:id])
  end

  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :phone_no)
  end 
end
