# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    UserMailer.with(user: UserAction.first).welcome_email
  end

  def update_email
    UserMailer.with(user: UserAction.first).update_email
  end
end
