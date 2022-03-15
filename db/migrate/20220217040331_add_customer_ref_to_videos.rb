class AddCustomerRefToVideos < ActiveRecord::Migration[6.1]
  def change
    add_reference :videos, :customer, null: false, foreign_key: true
  end
end
