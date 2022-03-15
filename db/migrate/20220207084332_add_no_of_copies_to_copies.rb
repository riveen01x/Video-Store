class AddNoOfCopiesToCopies < ActiveRecord::Migration[6.1]
  def change
    add_column :copies, :no_of_copies, :integer
  end
end
