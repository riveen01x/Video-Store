class AddStockToVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :stock, :integer
  end
end
