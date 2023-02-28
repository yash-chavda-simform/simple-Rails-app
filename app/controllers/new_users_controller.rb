class NewUsersController < ApplicationController
  before_action :require_login, only: [:index,:logout]
  def index 
  end

  def new
    @user = NewUser.new()
  end

  def create
    @user = NewUser.new(user_params)
    if @user.save
      redirect_to new_users_signup_path 
      flash[:success] = 'User was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def login; end

  def authenticate
    @user = NewUser.find_by(email:params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to cars_path  
    else
      flash[:danger] = 'Invalid email or password.'
      redirect_to new_users_login_path	
    end	 
  end

  def logout
    session.delete(:user_id)
    redirect_to new_users_login_path	    
  end

  private
  def user_params
    params.require(:new_user).permit(:first_name, :last_name, :email, :password)
  end
end
