class ReminderEmailJob < ActiveJob::Base
  RUN_EVERY = 1.minutes

  def perform(maildate)
    tasks = Task.all
    tasks.each do |task|
      if task.maildate == Date.today
        UserMailer.reminder_email(@user).deliver_later
      end
    end
    self.class.perform_later(wait: RUN_EVERY)
  end  

#check users maildate
#if users.maildate is today send remider email
#sent email reminder





end

