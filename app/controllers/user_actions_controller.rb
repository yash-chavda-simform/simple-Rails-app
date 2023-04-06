class UserActionsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = UserAction.all
  end

  def show; end
  
  def new
    @user = UserAction.new
  end
  
  def create
    @user = UserAction.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver_later
      redirect_to user_actions_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      if @user.saved_changes.include?('email')
        UserMailer.with(user: @user).update_email.deliver_later
        flash[:success] = "User Is Updated."
      end
      redirect_to user_actions_path
    else
      render :edit
    end 
  end

  def destroy
    if @user.destroy
      flash[:success] = "User Is Deleted."
    else
      flash[:danger] = "User Is Not Deleted."
    end
    redirect_to user_actions_path
  end

  private
  def user_params
    params.require(:user_action).permit(:name, :email, :profile)
  end

  def set_user
    @user = UserAction.find(params[:id])
  end
end
