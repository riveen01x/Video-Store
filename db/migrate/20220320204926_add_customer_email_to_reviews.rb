class AddCustomerEmailToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :customer_email, :string
  end
end
