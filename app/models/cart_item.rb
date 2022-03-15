class CartItem < ApplicationRecord
	belongs_to :video
	belongs_to :customer
        belongs_to :cart
	before_save :set_unit_price
	before_save :set_total




	def unit_price
		if persisted?
			self[:unit_price]
		else
			video.rent_price*2
		end
	end

	def total
		return unit_price*quantity
	end

	private
	

	def set_unit_price
		self[:unit_price] = unit_price
	end


	def set_total
		self[:total] = total
	end


end
