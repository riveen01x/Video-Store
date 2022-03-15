class DropLastNameFromActor < ActiveRecord::Migration[6.1]
  def change
    remove_column :actors, :last_name
  end
end
