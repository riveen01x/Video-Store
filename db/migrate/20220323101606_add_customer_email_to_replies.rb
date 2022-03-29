class AddCustomerEmailToReplies < ActiveRecord::Migration[6.1]
  def change
    add_column :replies, :customer_email, :string, null: true
  end
end
