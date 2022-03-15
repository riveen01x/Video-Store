class RentItem < ApplicationRecord
	belongs_to :rent
	belongs_to :video
	belongs_to :customer
        belongs_to :category

	before_save :set_unit_price
	before_save :set_total
        before_save :set_rented_at




	def unit_price
		if persisted?
			self[:unit_price]
		else
			video.rent_price + category.price
		end
	end

	def total
		return unit_price*copies
	end

	private
	

	def set_unit_price
		self[:unit_price] = unit_price
	end


	def set_total
		self[:total] = total
	end
  
        def set_rented_at
    		self[:rented_at] = Date.today
        end



end
