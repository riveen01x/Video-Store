class AddRentedAtToRentItems < ActiveRecord::Migration[6.1]
  def change
    add_column :rent_items, :rented_at, :date
  end
end
