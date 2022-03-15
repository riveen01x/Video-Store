class AddCustomerRefToRent < ActiveRecord::Migration[6.1]
  def change
    add_reference :rents, :customer, foreign_key: true
  end
end
