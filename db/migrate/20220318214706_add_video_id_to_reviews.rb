class AddVideoIdToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :video_id, :integer
  end
end
