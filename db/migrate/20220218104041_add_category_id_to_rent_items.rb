class AddCategoryIdToRentItems < ActiveRecord::Migration[6.1]
  def change
    add_column :rent_items, :category_id, :integer
  end
end
