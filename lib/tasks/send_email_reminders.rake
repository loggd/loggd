task :send_email_reminders => [:environment] do
  Reminder.ready_to_send.each do |reminder|
    ReminderMailer.with(user: reminder.journals.first.user).remind.deliver_later
  end
end
