class SessionsController < ApplicationController
  def index
  end
  
  def new
  end

  def create    
    session_params = params.permit(:email, :password)
    @user = User.find_by(email: session_params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id 
      redirect_to events_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to new_sessions_path
  end

end
