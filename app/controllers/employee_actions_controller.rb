class EmployeeActionsController < ApplicationController
  before_action :find_employee, only: [:show, :edit, :update, :destroy]
  def index
    @employees = EmployeeAction.all
  end
  
  def show
    binding.pry
  end

  def new
    @employee = EmployeeAction.new
    @employee.address_actions.build 
  end

  def create
    @employee = EmployeeAction.new(employee_params)
    if(@employee.save)
      redirect_to_employee
    else
      render :new
    end
  end

  def edit; end

  def update    
    if @employee.update(employee_params)
      redirect_to_employee
    else
      render :edit
    end
  end

  def destroy
    @employee.destroy
    redirect_to_employee
  end

  def search
    if params[:query].present?
      @employees = EmployeeAction.where("employee_name LIKE ?","%#{params[:query]}%")
    else
      @employees = EmployeeAction.all
    end
  end
  
  private
  def employee_params
    params.require(:employee_action).permit(:employee_name, :email, :password, :gender, :mobile_number, :birth_date, :hobbies, :file ,address_actions_attributes: [:house_name, :street_name, :road])
  end

  def find_employee
    @employee = EmployeeAction.find(params[:id])
  end

  def redirect_to_employee
    redirect_to employee_actions_path
  end
end
