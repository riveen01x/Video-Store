class AddBlurayCopiesToVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :bluray_copies, :integer
  end
end
