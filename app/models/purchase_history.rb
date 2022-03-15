class PurchaseHistory < ApplicationRecord
   belongs_to :video
   belongs_to :customer

   before_save :set_purchased_at



  def set_purchased_at
     self[:purchased_at] = Time.now
  end


   def self.search(search)
        if search 
            where(["name LIKE ?","%#{search}%"])
        else
            all
        end
    end 

end
