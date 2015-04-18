class UserMailer < ApplicationMailer
  default from: 'noreply@example.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Heed the Horse')
  end

  def reminder_email(user)
    @user = user
    mail(to: @user.email, subject: 'Reminder of Horse event')
  end  

  def weater_email(user)
    @user = user
    mail(to: @user.email, subject: 'Chance of Rain')
  end  
end
