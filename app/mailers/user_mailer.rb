class UserMailer < ApplicationMailer
  layout "mailer_update", :only => :update_email
  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: "User Is Created.")
  end

  def update_email
    @user = params[:user]
    mail(to: @user.email, subject: "Email Is Updated") do |format|
      format.text(content_type: "text/plain")
    end
  end
end
