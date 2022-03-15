class AddCustomerRefToRentItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :rent_items, :customer, foreign_key: true
  end
end
