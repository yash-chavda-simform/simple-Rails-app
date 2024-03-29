class EventsController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]

  def index
    session[:cat_id]
    category_options   
    if(session[:cat_id] == nil)
      @events = Event.all
    else
      @events = Event.where(category_id:session[:cat_id])
    end
  end

  def show; end
  
  def new
    @event = Event.new
    category_options  
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to sessions_userOptions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    category_options
  end

  def update
    if @event.update(event_params)
      redirect_to sessions_path
    else
      render :edit, status: :unprocessable_entity
    end 
  end

  def destroy
    @event.delete
    redirect_to sessions_path
    end

  def find_id
    @event = Event.find(params[:id])
  end

  def enroll
    puts params[:id]
    find_id
    puts @event
  end 

  def filter
    session[:cat_id]=params[:category_id]
    if(session[:cat_id] == "1")
      session[:cat_id] = nil
    end
    redirect_to events_path		
  end

  def category_options
    @category_options = Category.all.map{ |a| [a.name,a.id] }
  end
  
  private
  def event_params
    params.require(:event).permit(:name, :description, :event_date, :category_id, :organizer_id)
  end
end
