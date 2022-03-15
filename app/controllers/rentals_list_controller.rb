class RentalsListController < ApplicationController
  def show
    @rent_items = current_customer.rent_items
 
    @total_amt = current_customer.rent_items.collect { |rent_item| rent_item.unit_price*rent_item.copies }.sum


    #create_pdf
    ReportWorker.perform_async("12-02-2022", "12-03-2022")
    create_pdf
   end

 def destroy 
    @rent_items = current_customer.rent_items
    @rent_items.each do |item|
                @video = Video.find(item.video_id)
                @copies = item.copies
                @current_category_id = item.category_id.to_i
		item.destroy
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
    end
redirect_to rentals_list_show_path, notice: "Rentals deleted successfully!"
 end

  def create_pdf

    # GeneratePdfJob.perform_now
     respond_to do |format|
      format.html
      format.pdf do
        render pdf: "show"   # Excluding ".pdf" extension.
        sleep 2
      end
    end

  end

  def generate_report
    ReportWorker.perform_async("08-12-2022", "09-12-2022")
    render text: "REQUEST TO GENERATE A REPORT ADDED TO THE QUEUE"
  end
end
