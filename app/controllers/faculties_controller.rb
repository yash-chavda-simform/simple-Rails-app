class FacultiesController < ApplicationController
  
  before_action :find_id, only: [:show, :edit, :update, :destroy]

  def index
    @faculties = Faculty.all
  end

  def show; end
  
  def new
    @faculty = Faculty.new
  end
  
  def create
    @faculty = Faculty.new(faculty_params)
    if @faculty.save
      redirect_to faculties_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @faculty.update(faculty_params)
      redirect_to faculties_path
    else
      render :edit, status: :unprocessable_entity
    end 
  end

  def destroy
    @faculty.delete
    redirect_to faculties_path
    end

  def find_id
    @faculty = Faculty.find(params[:id])
  end

  private
  def faculty_params
    params.require(:faculty).permit(:first_name, :last_name, :phone_no, :email, :birth_date, :designation)
  end
end

