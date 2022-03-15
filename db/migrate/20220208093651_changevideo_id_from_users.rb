class ChangevideoIdFromUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :actors, :video_id, :integer, null: true
  end
end
