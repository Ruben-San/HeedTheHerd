class UserMailer < ApplicationMailer
  default from: 'noreply@example.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Heed the Horse')
  end
end
