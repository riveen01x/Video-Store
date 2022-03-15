class CheckoutsController < ApplicationController
before_action :authenticate_customer!

def show
 current_customer.processor = :stripe
 current_customer.customer

 @checkout_session.current_customer.payment_processor.checkout(
   mode: "payment",
   line_item: ""
 )
end


end
