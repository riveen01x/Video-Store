class RentalsMailer < ApplicationMailer

  def new_rent(customer, video, rent)
    @video = video
    @item = rent
    mail(
        to: customer.email,
        subject: "Reminder, your 2 days away from returning!" 
    )
  end

end
