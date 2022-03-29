class AddCustomerEmailToCancelledOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :cancelled_orders, :customer_email, :string
  end
end
