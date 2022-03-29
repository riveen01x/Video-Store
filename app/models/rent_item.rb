class RentItem < ApplicationRecord
	belongs_to :rent
	belongs_to :video
	belongs_to :customer
        belongs_to :category

        before_save :set_rented_at
	before_save :set_unit_price
	before_save :set_total
        
        after_commit :create_notifications, on: :create

        validates :return_date, :presence => {message: 'Id number required'}



        def set_rented_at
    		self[:rented_at] = Date.today
        end
 
	def unit_price
		if persisted?
			self[:unit_price]
		else
			video.rent_price + category.price
		end
	end

        def time_in_days
               return (self[:return_date] - self[:rented_at]).seconds.in_days.to_i
        end

	def total
		return unit_price*copies*time_in_days
	end

	private
	

	def set_unit_price
		self[:unit_price] = unit_price
	end


	def set_total
		self[:total] = total
	end

        def create_notifications
           Notification.create do |notification|
             notification.notify_type = 'video'
             notification.user = self.video.user
             notification.target = self
             notification.second_target = self.video
           end
        end
  

end
