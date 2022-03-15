class AlterTableVideosDropActorId < ActiveRecord::Migration[6.1]
  def change
        remove_column :videos, :actor_id
  end
end
