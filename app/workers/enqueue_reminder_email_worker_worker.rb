class EnqueueReminderEmailWorkerWorker
  include Sidekiq::Worker

  def perform(reminder_id)
    reminder = Reminder.find_by(id: reminder_id)

    return if reminder.nil?

    ReminderMailer.with(user: reminder.journals.first.user).remind.deliver_later
  end
end
