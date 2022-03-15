module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    if customer_signed_in?
      flash.clear
      redirect_to(root_path) and return
    end
  end
end

