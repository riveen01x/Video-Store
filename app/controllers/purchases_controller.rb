class PurchasesController < ApplicationController

  before_action :authenticate_user, only: :orders

  def show
    @purchase = Purchase.find_by_uuid(params[:id])
    @sell_price = @purchase.amount/100.to_f 
    @video = Video.find_by(params[:video_id])
    @cart_items = current_customer.cart_items.to_a


    @cart_items.each do |item|
       @customer = Customer.find(item.customer_id)
       PurchaseHistory.create(item.attributes)
       item.destroy
       if item.destroy
         OrderMailer.with(cart_items: @cart_items, customer: @customer, sell_price: @sell_price).new_order_email.deliver_now

         flash[:success] = "Thank you for your order! We'll get contact you soon!"
       else
         flash.now[:error] = "Your order form had some errors. Please check the form and resubmit."
    end
    end

  end


  def previous_purchases
   @purchase_histories = current_customer.purchase_histories.paginate(page: params[:page], per_page: 4)
   @cart_items = current_customer.cart_items.paginate(page: params[:page], per_page: 4)

  # @purchase_histories = @purchase_histories.search(params[:search]) 
  end

  def orders
   @choice = 4

  if params[:filter] && params[:option]
      if params[:option].to_i == 0
   	@finished_orders = PurchaseHistory.limit(params[:filter]).order('purchased_at ASC')
      else
        @finished_orders = PurchaseHistory.limit(params[:filter]).order('purchased_at DESC')
      end
   else
        @finished_orders = PurchaseHistory.limit(4).order('purchased_at DESC')
   end

   if params[:filter2] && params[:option]
      if params[:option].to_i == 0
   	@orders = CartItem.limit(params[:filter2]).order('created_at ASC')
      else
        @orders = CartItem.limit(params[:filter2]).order('created_at DESC')
      end
   else
        @orders = CartItem.limit(4).order('created_at DESC')
   end


   if params[:filter3] && params[:option]
      if params[:option].to_i == 0
   	@cancelled_orders = CancelledOrder.limit(params[:filter3]).order('created_at ASC')
      else
        @cancelled_orders = CancelledOrder.limit(params[:filter3]).order('created_at DESC')
      end
   else
        @cancelled_orders = CancelledOrder.limit(4).order('created_at DESC')
   end

  end

 private

  def authenticate_user
   if !user_signed_in? 
    redirect_to videos_path
    flash[:error] = "Restricted access!"
   end
  end


end
