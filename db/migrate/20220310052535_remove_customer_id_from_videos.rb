class RemoveCustomerIdFromVideos < ActiveRecord::Migration[6.1]
  def change
    remove_column :videos, :customer_id, :integer
  end
end
