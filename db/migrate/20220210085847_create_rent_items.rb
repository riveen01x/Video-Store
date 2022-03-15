class CreateRentItems < ActiveRecord::Migration[6.1]
  def change
    create_table :rent_items do |t|
      t.integer :copies
      t.integer :video_id
      t.integer :rent_id
      t.decimal :total
      t.decimal :unit_price

      t.timestamps
    end
  end
end
