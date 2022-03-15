class CreateGenresVideosJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :genres_videos, id: false do |t|
      t.belongs_to :video
      t.belongs_to :genre
    end
  end
end
