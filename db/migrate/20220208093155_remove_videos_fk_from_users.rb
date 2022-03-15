class RemoveVideosFkFromUsers < ActiveRecord::Migration[6.1]

  def change
    if foreign_key_exists?(:actors, :videos)
      remove_foreign_key :actors, :videos
    end
  end

end
