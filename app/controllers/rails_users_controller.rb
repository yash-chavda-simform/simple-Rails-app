class RailsUsersController < ApplicationController
  before_action :require_rails_login, only: [:logout]
  def new
    @user = RailsUser.new
  end
  
  def create
    @user = RailsUser.new(user_params)
    if @user.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def login; end

  def authenticate
    @user = RailsUser.find_by(email:params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to posts_path
    else 
      flash[:danger] = 'Invalid email or password.'
      redirect_to rails_users_login_path
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to rails_users_login_path
  end

  private
  def user_params
    params.require(:rails_user).permit(:first_name, :last_name, :email, :password)   
  end
end
