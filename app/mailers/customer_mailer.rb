class CustomerMailer < ApplicationMailer
  
  def new_video(user, video)
   @video = video
    mail(
	 to: user.email,
	 subject: "New video added",
	)
  end

end
