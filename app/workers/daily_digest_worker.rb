class DailyDigestWorker

  include Sidekiq::Worker
  sidekiq_options :queue => :mailer

  recurrence { daily }

  def perform
    User.find_each do |user|
      DailyDigestMailer.digest_email(user)
    end
  end

end
