class CreateJoinTableActorsVideos < ActiveRecord::Migration[6.1]
  def change
    create_join_table :actors, :videos do |t|
      t.index [:actor_id, :video_id]
      t.index [:video_id, :actor_id]
    end
  end
end
