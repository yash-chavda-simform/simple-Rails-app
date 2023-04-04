class ApplicationController < ActionController::Base 
  helper_method :current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_user
    @current_user ||= NewUser.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless current_user
      redirect_to new_users_login_path
      flash[:danger] = "You Need To Login First"
    end
  end

  def check_user
    authenticate_user_rendering!.role.eql?("admin") ? true : false 
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

  private
  def set_layout
    authenticate_user_rendering!.role.eql?("admin") ? "admin" : "merchant"
  end

  def check_access 
    unless check_user
      redirect_to product_renderings_path	 
    end 
  end
end
