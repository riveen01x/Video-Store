class CreateReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :replies do |t|
      t.string :content
      t.integer :review_id

      t.timestamps
    end
  end
end
