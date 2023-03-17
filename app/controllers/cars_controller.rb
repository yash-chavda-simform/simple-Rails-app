class CarsController < ApplicationController
  before_action :find_car, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  http_basic_authenticate_with name: "admin", password: "admin", digest: true
  
  def index
    @cars = Car.all
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        pdf = Prawn::Document.new
        pdf.text "#{cookies[:name]} has booked the car\n Car Details\n\n Car Name: #{@car.name}\n Car Color: #{@car.color}\n"
        send_data pdf.render, filename: "car_profile.pdf",
                              type: "application/pdf",
                              disposition: "attachment"
      end
    end
  end
  
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

  def search
    if params[:search].present?
      @cars = Car.where("name LIKE ?", "%#{params[:search]}%")
    else
      @cars = Car.all
    end
 end

  private
  def car_params
    params.require(:car).permit(:name, :color)
  end

  def find_car
    @car = Car.find(params[:id])
  end
end
