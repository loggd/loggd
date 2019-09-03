class ReminderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reminder_mailer.remind.subject
  #
  def remind
    @user = params[:user]

    mail to: @user.email
  end
end
