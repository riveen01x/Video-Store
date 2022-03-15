class LineItem < ApplicationRecord
  belongs_to :video
  belongs_to :cart

  def total_price
    video.rent_price.to_i*2*quantity.to_i
  end

 
end
