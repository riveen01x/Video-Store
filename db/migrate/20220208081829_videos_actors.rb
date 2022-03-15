class VideosActors < ActiveRecord::Migration[6.1]
  def change
    create_table "videos_actors", id: false, force: :cascade do |t|
      t.integer "video_id"
      t.integer "actor_id"
      t.index ["actor_id"], name: "index_videos_actors_on_actor_id"
      t.index ["video_id"], name: "index_actors_videos_on_video_id"
    end
  end
end
