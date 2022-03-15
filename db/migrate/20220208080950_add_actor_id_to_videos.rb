class AddActorIdToVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :actor_id, :integer
    add_index :videos, :actor_id
  end
end
