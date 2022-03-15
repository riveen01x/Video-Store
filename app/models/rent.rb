class Rent < ApplicationRecord
	has_many :rent_items 
	before_save :set_subtotal
        before_save :set_customer
        belongs_to :customer
    


	def subtotal
		rent_items.collect { |rent_item| rent_item.valid? ? rent_item.unit_price*rent_item.copies : 0 }.sum
	end

	private

	def set_subtotal
		self[:subtotal] = subtotal
	end

        def set_customer
                self[:customer_id] = current_customer.id
        end
end
