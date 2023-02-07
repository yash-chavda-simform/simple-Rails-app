class StudentsController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def show; end
  
  def new
    @student = Student.new
  end
  
  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @student.update(student_params)
      redirect_to students_path
    else
      render :edit, status: :unprocessable_entity
    end 
  end

  def destroy
    @student.delete
    redirect_to students_path
    end

  def find_id
    @student = Student.find(params[:id])
  end

  private
  def student_params
    params.require(:student).permit(:first_name, :last_name, :birth_date, :department, :term_and_condition)
  end
end
