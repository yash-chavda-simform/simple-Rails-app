class EmployeesController < ApplicationController
  before_action :find_employee, only: [:show, :edit, :update, :destroy]
  def index
    @employees = Employee.all.order(:id)
  end
  
  def show; end

  def new
    @employee = Employee.new
  end

  def create
    # @employee = Employee.find_or_create_by(employee_params)
    @employee = Employee.find_or_initialize_by(employee_params)
    if(@employee.save)
      redirect_to_employee
    end
  end

  def edit; end

  def update    
    if @employee.update(employee_params)
      redirect_to_employee
    end
  end

  def destroy
    @employee.delete
    redirect_to_employee
  end

  def verify_email
    @email = Employee.find_by(email: params[:email])
    if @email
      flash[:success] = "Email Is Available"
    else
      flash[:danger] = "Email Is Not Available"
    end
    redirect_to_employee 
  end

  def employees_result; end

  def increase
    Employee.limit(10).find_in_batches(start: 1, batch_size: 4) do |employee|
      Employee.where(id: employee.map(&:id)).update_all("no_of_order = no_of_order + 1")    
    end 
    redirect_to_employee
  end

  def decrease
    Employee.limit(10).find_in_batches(start: 1, batch_size: 4) do |employee|
      Employee.where(id: employee.map(&:id)).update_all("no_of_order = no_of_order - 1")
    end
    redirect_to_employee
  end

  def redirect_to_employee
    redirect_to employees_path
  end
  
  private
  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :age, :no_of_order, :full_time_available, :salary, :lock_version)
  end

  def find_employee
    @employee = Employee.find(params[:id])
  end
end
