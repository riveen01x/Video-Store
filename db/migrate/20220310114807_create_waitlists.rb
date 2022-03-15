class CreateWaitlists < ActiveRecord::Migration[6.1]
  def change
    create_table :waitlists do |t|
      t.string :email
      t.integer :video_id

      t.timestamps
    end
  end
end
