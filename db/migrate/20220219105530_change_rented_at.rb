class ChangeRentedAt < ActiveRecord::Migration[6.1]
  def change
    change_column :rent_items, :rented_at, :datetime
  end
end
