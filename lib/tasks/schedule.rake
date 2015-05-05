namespace :schedule do 
  desc 'starts recuring emails'
  task :jobs => :environment do
    ReminderEmailJob.schedule(run_at: '11:00')
    RainyCheckJob.schedule(run_at: '11:00')
  end 
end