class DailyDigestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.daily_digest_mailer.digest_email.subject
  #
  def digest_email(user)
    @user = user
    mail to: user.email, subject: "Daily Reminder"
  end
end
