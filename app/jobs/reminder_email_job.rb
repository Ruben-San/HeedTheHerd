class ReminderEmailJob < ActiveJob::Base
  queue_as :email

  def perform(maildate)
    user.task.maildates do |d|
      d.today?
      UserMailer.reminder_email(@user).deliver_later
    end
  end


#check users maildate
#if users.maildate is today send remider email
#sent email reminder





end

