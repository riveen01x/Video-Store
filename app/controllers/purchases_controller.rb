class PurchasesController < ApplicationController

  before_action :initialize_search

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
    handle_filters
   if params[:filter]
   	@finished_orders = PurchaseHistory.limit(params[:filter]).order(params[:sort])
   else
        @finished_orders = PurchaseHistory.limit(4).order(params[:sort])
   end
   @orders = CartItem.order(params[:sort]).paginate(page: params[:page], per_page: 4)
   @cancelled_orders = CancelledOrder.order('created_at DESC').paginate(page: params[:page], per_page: 4)
  end

 private

  def initialize_search
    params[:search]
  end

  def handle_search_name
    if params[:search]
      @purchase_histories = current_customer.purchase_histories.where("name like ?", "%#{params[:search].titleize}%")
    else
       @purchase_histories = current_customer.purchase_histories.to_a
    end
  end


  def handle_filters
    if session[:filter_option] && session[:filter] == "role"
      @roles = @roles.where(id: session[:filter_option])
    end
   end

end
