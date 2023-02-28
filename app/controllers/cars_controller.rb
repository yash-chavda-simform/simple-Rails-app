class CarsController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  def index
    @cars = Car.all
  end

  def show; end
  
  def new
    @car = Car.new
  end
  
  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to cars_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @car.update(car_params)
      redirect_to cars_path
    else
      render :edit, status: :unprocessable_entity
    end 
  end

  def destroy
    @car.delete
    redirect_to cars_path
  end

  def find_id
    @car = Car.find(params[:id])
  end

  def search
    @cars = Car.all
 end

  private
  def car_params
    params.require(:car).permit(:name, :color)
  end
end
