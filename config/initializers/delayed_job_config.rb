Delayed::Worker.max_attempts = 1
 ReminderEmailJob.schedule(run_at: '12:00')
    RainyCheckJob.schedule(run_at: '12:00')