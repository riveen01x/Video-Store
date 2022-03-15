class WaitlistsMailer < ApplicationMailer

 def stock_available(email, video)
   @video = video
   @email = email
   mail(
       to: @email,
       subject: "Available in stock!",
      )
 end

end
