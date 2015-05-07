class UserMailer < ApplicationMailer
  default from: 'noreply@heedtheheerd.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Heed the Horse')
  end

  def reminder_email(user)
    @user = user
    mail(to: @user.email, subject: 'Reminder of Horse event')
  end  

  def weather_email(user)
    @user = user
    mail(to: @user.email, subject: 'Chance of Rain')
  end  
end
