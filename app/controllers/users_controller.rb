class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(email: user_params[:email], password: user_params[:password])
    @user.create_address(content: user_params[:address])
    if(@user)
      redirect_to new_session_path
    else
      render :new, status: :unprocessable_entity
    end
  end
   
  private
  def user_params
    params.require(:user).permit(:email, :password, :address)
  end
end
