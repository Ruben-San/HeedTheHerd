namespace :schedule do 
  desc 'starts recuring emails'
  task :jobs => :environment do
    ReminderEmailJob.schedule(run_at: '12:00')
    RainyCheckJob.schedule(run_at: '12:00')
  end 
end