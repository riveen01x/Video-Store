class FixFirstName < ActiveRecord::Migration[6.1]
  def change
    rename_column :actors, :first_name, :full_name
  end
end
