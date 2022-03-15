class ChangeVideosActorsToActorsVideos < ActiveRecord::Migration[6.1]
  def change
    rename_table :videos_actors, :actors_videos
  end
end
