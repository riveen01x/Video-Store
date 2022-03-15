class AddUuidToPurchases < ActiveRecord::Migration[6.1]
  def change
    add_column :purchases, :uuid, :string
  end
end
