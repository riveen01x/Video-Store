class AddReplyIdToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :reply_id, :integer, null: true
  end
end
