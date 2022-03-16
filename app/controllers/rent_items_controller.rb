class RentItemsController < ApplicationController
skip_before_action :verify_authenticity_token


  # code included  here will be modified to DRY later..
	def create
                if !current_customer.nil?
      		  @rent = current_rent
		  @rent_item = @rent.rent_items.build(rent_params)
		 #@rent_item.category_id = params[:category_id]
		  @rent_item.rent_id = current_customer.id
                  @video = Video.find(@rent_item.video_id)
                  @copies = @rent_item.copies
                  @current_category_id = @rent_item.category_id.to_i
		  @rent_item.save

                  if @current_category_id == 1
                    @available = @video.dvd_copies - @copies
                    @video.update(:dvd_copies => @available)
                  elsif @current_category_id == 2 
                    @available = @video.vhs_copies - @copies
                    @video.update(:vhs_copies => @available)
                  elsif @current_category_id == 3 
                    @available = @video.bluray_copies - @copies
                    @video.update(:bluray_copies => @available)
                  end


		  session[:rent_id] = @rent.id
                  if @rent_item.save 
                    redirect_to videos_path, notice: "Added to rentals list successfully!"
                  end
                else
                  redirect_to new_customer_session_path, notice: "Please log in to rent!"
                end
	end

 


	def destroy
		@rent = current_rent
		@rent_item = current_customer.rent_items.find(params[:id])
                @video = Video.find(@rent_item.video_id)
                @copies = @rent_item.copies
                @current_category_id = @rent_item.category_id.to_i
		@rent_item.destroy
                if @current_category_id == 1
                    @available = @video.dvd_copies + @copies
                    @video.update(:dvd_copies => @available)
                elsif @current_category_id == 2 
                    @available = @video.vhs_copies + @copies
                    @video.update(:vhs_copies => @available)
                elsif @current_category_id == 3 
                    @available = @video.bluray_copies + @copies
                    @video.update(:bluray_copies => @available)
                end
		@rent_items = current_rent.rent_items
	     redirect_to rentals_list_show_path, notice: "Item deleted successfully!"
	end



	private
        

	def rent_params
        	params.require(:rent_item).permit(:video_id, :copies, :customer_id, :category_id, :rented_at, :return_date)
	end

 
        # create the DRY method
end
