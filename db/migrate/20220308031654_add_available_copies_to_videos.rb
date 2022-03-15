class AddAvailableCopiesToVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :available_copies, :integer
  end
end
