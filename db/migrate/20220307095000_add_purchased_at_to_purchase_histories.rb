class AddPurchasedAtToPurchaseHistories < ActiveRecord::Migration[6.1]
  def change
    add_column :purchase_histories, :purchased_at, :datetime
  end
end
