class EventsController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]

  def index
    if(session[:user_id]!=nil)
      puts "id is there"
      @events = Event.all
    else
      redirect_to new_sessions_path
    end
  end

  def show; end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to events_path
    else
      render :edit, status: :unprocessable_entity
    end 
  end

  def destroy
    @event.delete
    redirect_to events_path
    end

  def find_id
    @event = Event.find(params[:id])
  end

  private
  def event_params
    params.require(:event).permit(:email, :description, :event_date)
  end
end
