class RemoveAvailableCopiesToVideos < ActiveRecord::Migration[6.1]
  def change
    remove_column :videos, :available_copies
  end
end
