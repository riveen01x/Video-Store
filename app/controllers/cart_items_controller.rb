class CartItemsController < ApplicationController

skip_before_action :verify_authenticity_token


  # code included  here will be modified to DRY later..
	def create
                if !current_customer.nil?
      		  @cart = current_cart
		  @cart_item = @cart.cart_items.build(cart_params)
		  @cart_item.cart_id = current_customer.id
                  @video = Video.find(@cart_item.video_id)
                  @quantity = @cart_item.quantity
		  @cart_item.save
                  @available_stock = @video.stock - @quantity
                  @video.update(:stock => @available_stock)
		  session[:cart_id] =  @cart.id
                  redirect_to video_path(@video), notice: "Added to cart!"
                else
                  redirect_to new_customer_session_path, notice: "Please log in!"
                end
	end

        def update
		@cart = current_cart
		@cart_item = current_customer.cart_items.find(params[:id])
                @video = Video.find(@cart_item.video_id)
                @quantity = @cart_item.quantity
		@cart_item.update(cart_params)
                if @cart_item.quantity > @quantity
                    @quantity = @cart_item.quantity - @quantity
                    @available_stock = @video.stock - @quantity
                    @video.update(:stock => @available_stock) 
                else 
                    @quantity = @quantity - @cart_item.quantity
                    @available_stock = @video.stock + @quantity
                    @video.update(:stock => @available_stock) 
                end
		@cart_items = current_cart.cart_items
        redirect_to cart_list_show_path, notice: "Item updated successfully!"
	end

	def destroy
		@cart = current_cart
                if current_customer.nil?
                   @cart_item = CartItem.find(params[:id])
                else
		   @cart_item = current_customer.cart_items.find(params[:id])
                end
                @video = Video.find(@cart_item.video_id) 
                @quantity = @cart_item.quantity
		@cart_item.destroy    
	        if @cart_item.destroy
		  @cancelled_item = CancelledOrder.create(@cart_item.attributes)
                  @cancelled_item.customer_email = @cart_item.customer.email
	        end
                @available_stock = @video.stock + @quantity
                @video.update(:stock => @available_stock) 
		@cart_items = current_cart.cart_items
          
             respond_to do |format|
                 if customer_signed_in?
                    format.js
        	    format.html { redirect_to cart_list_show_path, notice: "Item deleted successfully!"   }
                 else
                    format.html { redirect_to purchases_orders_path, notice: "Order Item cancelled!" }
                 end
             end 
	end



	private
        

	def cart_params
        	params.require(:cart_item).permit(:video_id, :customer_id, :quantity)
	end


end
