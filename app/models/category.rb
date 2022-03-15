class Category < ApplicationRecord
 has_many :videos
 has_many :rent_items
end
