class AddPriceToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :price, :decimal
  end
end
