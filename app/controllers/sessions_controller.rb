class SessionsController < ApplicationController
  def index
  end
  
  def new
  end
  
  def show 
    @events = Event.where(user_id: session[:user_id])
  end

  def create    
    session_params = params.permit(:email, :password)
    @user = User.find_by(email: session_params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id 
      redirect_to sessions_userOptions_path	
    end
  end

  def profile
    @details = User.find_by(id:session[:user_id]) 
    @event = @details.events
  end

  def logout
    session[:user_id] = nil
    redirect_to new_session_path
  end
  
  def user_options
  end
end