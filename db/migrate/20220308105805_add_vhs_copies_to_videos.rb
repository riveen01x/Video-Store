class AddVhsCopiesToVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :vhs_copies, :integer
  end
end
