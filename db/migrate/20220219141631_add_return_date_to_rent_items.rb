class AddReturnDateToRentItems < ActiveRecord::Migration[6.1]
  def change
    add_column :rent_items, :return_date, :datetime
  end
end
