class ReminderEmailJob < ActiveJob::Base
  include Delayed::RecurringJob
  run_every 1.day
  run_at '11:00am'
  timezone 'US/Pacific'
  queue 'reminder-jobs'

  def perform
    tasks = Task.all
    tasks.each do |task|
      if task.maildate == Date.today
        horse = Horse.find(task.horse_id)
        user = User.find(horse.user_id)
        UserMailer.reminder_email(@user).deliver_later
      end
    end
    
  end  

#check users maildate
#if users.maildate is today send remider email
#sent email reminder





end

