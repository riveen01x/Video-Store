class Review < ApplicationRecord
 belongs_to :video
 has_many :replies
end
