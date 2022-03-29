class RemoveReplyIdFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :reply_id, :integer
  end
end
