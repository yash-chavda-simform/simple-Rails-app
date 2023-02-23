class EmployeesController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]
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
    @id = Employee.find(params[:id])
    if @employee.update(employee_params.merge(lock_version: @id.lock_version))
      redirect_to_employee
    else
    end
	end

	def destroy
    @employee.delete
    redirect_to_employee
	end

  def checkmail
    @email = Employee.find_by(email: params[:email])
    if @email
      flash[:success] = "Email Is Available"
    else
      flash[:danger] = "Email Is Not Available"
    end
    redirect_to_employee 
  end

  def result
    @ages = Employee.where('age > ?',20).where('age < ?',40)
    @availables = Employee.where('full_time_available = ?', true)
    @above_ages = Employee.where('no_of_order = ?', 5).where('age > ?', 25) 
    @yesterdays = Employee.where('created_at < ?', Date.today)
    @below_ages = Employee.where('no_of_order = ?', 5).or(Employee.where('age < ?', 25)) 
    @descending_ages = Employee.order(age: :desc)
    @ascending_orders = Employee.order(no_of_order: :asc)
    @salary_employees = Employee.where('salary > ?',45000) 
    @unscope_employees = Employee.where('no_of_order = ?',5).limit(2).unscope(:limit)
    @only_employees = Employee.where('no_of_order = ?',5).limit(2).only(:limit)
    @select_employees = Employee.select(:email).where(no_of_order:5).reselect(:first_name, :last_name, :email)
    @reorder_orders = Employee.order(no_of_order: :asc).reorder(no_of_order: :desc)
    @reverse_orders = Employee.order(salary: :asc).reverse_order
  end

  def find_id
    @employee = Employee.find(params[:id])
  end

  def increase
    Employee.limit(10).find_in_batches(start: 1, batch_size: 4) do |employee|
      employee.each do |e|
        e.update(no_of_order: e.no_of_order+1)
      end
    end
    redirect_to_employee
  end

  def decrease
    Employee.limit(10).find_in_batches(start: 1, batch_size: 4) do |employee|
      employee.each do |e|
        e.update(no_of_order: e.no_of_order - 1)
      end
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
end
