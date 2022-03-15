class AddCopyTypeToCopies < ActiveRecord::Migration[6.1]
  def change
    add_column :copies, :copy_type, :integer
  end
end
