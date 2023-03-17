class ApplicationController < ActionController::Base 
  helper_method :current_user
  def current_user
    @current_user ||= NewUser.find(session[:user_id]) if session[:user_id]
  end

  private
  def require_login
    unless current_user
      redirect_to new_users_login_path
      flash[:danger] = "You Need To Login First"
    end
  end
end
