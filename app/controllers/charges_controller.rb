class ChargesController < ApplicationController
before_action :customer, only: [:new, :create]

def new
end

def create

Stripe.api_key='sk_test_51KVhP4G3fzkVwYj6fpRe7IXO9oIjBYlkwfGLqgVOFFRc9nzAqb6i53hBcgKPEDcdnUzloTIbOHqrAbPsAEv20p1a00PrpXU54C'

token = params[:stripeToken]

  customer = Stripe::Customer.create(
    email: params[:stripeEmail],
    :source  => 'tok_visa'
  )

 @charge = params[:amount].to_f


 begin
  charge = Stripe::Charge.create(
    customer: customer.id,
    amount: params[:amount].to_i,
    description: 'Rails Stripe customer',
    currency: 'usd'
  )

   purchase = Purchase.create(email: params[:stripeEmail], card: params[:stripeToken], 
amount: params[:amount], description: charge.description, currency: charge.currency, customer_id:  customer.id, video_id: params[:video_id], uuid: SecureRandom.uuid)

   redirect_to purchase


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end


def customer
  if !customer_signed_in?
     redirect_to new_customer_session_path, alert: "Payment unsucessfull!"
  end
end

end
