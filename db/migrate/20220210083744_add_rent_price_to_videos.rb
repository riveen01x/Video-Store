class AddRentPriceToVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :rent_price, :decimal
  end
end
