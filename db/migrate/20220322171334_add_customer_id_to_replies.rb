class AddCustomerIdToReplies < ActiveRecord::Migration[6.1]
  def change
    add_column :replies, :customer_id, :integer, null: true
    add_column :replies, :user_id, :integer, null: true
  end
end
