task :send_email_reminders => [:environment] do
  Reminder.today.each do |reminder|
    date = Date.today
    time = Time.new(date.year, date.month, date.day, reminder.hour, reminder.minute)
    EnqueueReminderEmailWorkerWorker.perform_at(time, reminder.id)
  end
end
