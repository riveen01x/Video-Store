class AddUserEmailToReplies < ActiveRecord::Migration[6.1]
  def change
    add_column :replies, :user_email, :string, null: true
  end
end
