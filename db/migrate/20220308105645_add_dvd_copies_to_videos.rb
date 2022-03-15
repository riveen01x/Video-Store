class AddDvdCopiesToVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :dvd_copies, :integer
  end
end
