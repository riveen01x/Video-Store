class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :cart_id
      t.integer :video_id
      t.decimal :total
      t.decimal :unit_price
      t.integer :customer_id

      t.timestamps
    end
  end
end
