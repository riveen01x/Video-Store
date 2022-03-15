class CreatePurchaseHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :purchase_histories do |t|
      t.integer :video_id
      t.decimal :total
      t.decimal :unit_price
      t.integer :quantity
      t.integer :customer_id

      t.timestamps
    end
  end
end
