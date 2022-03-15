class RemoveDescriptionFromVideos < ActiveRecord::Migration[6.1]
  def change
    remove_column :videos, :description
  end
end
