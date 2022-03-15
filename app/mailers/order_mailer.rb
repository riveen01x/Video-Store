class OrderMailer < ApplicationMailer
  def new_order_email
     @cart_items = params[:cart_items]
     @customer = params[:customer]
     @sell_price  = params[:sell_price]
    mail(to: @customer.email, subject: "Checkout - ORDER NO: 1010911")
  end

end
