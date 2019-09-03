# Preview all emails at http://localhost:3000/rails/mailers/reminder_mailer
class ReminderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/reminder_mailer/remind
  def remind
    ReminderMailer.with(user: User.first).remind
  end

end
