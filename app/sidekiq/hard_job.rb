class HardJob
  include Sidekiq::Job

  
  def perform(*args)
    CustomerMailer.welcome_email.deliver
  end
end
