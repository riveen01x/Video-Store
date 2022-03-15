class ApplicationController < ActionController::Base
        protect_from_forgery with: :exception
	include ApplicationHelper
        include CurrentCart
        before_action :set_cart

	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :this_user, if: :devise_controller?, only: :new



	rescue_from CanCan::AccessDenied do
          flash[:error] = 'Access denied!'
          redirect_to root_url
        end

  
  def clear_session(*args)
    args.each do |session_key|
      session[session_key] = nil
    end
  end


  def this_user
    if customer_signed_in?
      redirect_to root_url
      flash[:error] = 'Access denied!'
    end
  end



	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
		devise_parameter_sanitizer.permit(:account_update, keys: [:name])
	end 

end
