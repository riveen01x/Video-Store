class CreateRents < ActiveRecord::Migration[6.1]
  def change
    create_table :rents do |t|
      t.decimal :subtotal
      t.decimal :total

      t.timestamps
    end
  end
end
