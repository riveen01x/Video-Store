class Cart < ApplicationRecord

  has_many :line_items, dependent: :destroy
   before_save :set_customer
   has_many :cart_items 

    def add_video(video)
      current_item = line_items.find_by(video_id: video.id)
      if current_item 
         current_item.increment(:quantity)
      else
         current_item = line_items.build(video_id: video.id)
      end
     current_item
    end


    def total_price
      line_items.to_a.sum { |item| item.total_price }
    end

 def set_customer
   #self[:customer_id] = current_customer.id
  end

end
