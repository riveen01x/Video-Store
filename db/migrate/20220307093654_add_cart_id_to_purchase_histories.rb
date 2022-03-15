class AddCartIdToPurchaseHistories < ActiveRecord::Migration[6.1]
  def change
    add_column :purchase_histories, :cart_id, :integer
  end
end
