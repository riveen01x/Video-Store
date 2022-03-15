class Customer < ApplicationRecord
    pay_customer

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :videos
  has_many :rent_items, dependent: :destroy
  has_many :rent
  has_many :cart_items, dependent: :destroy
  has_many :purchase_histories


end
