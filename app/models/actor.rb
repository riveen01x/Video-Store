class Actor < ApplicationRecord
  has_many :actors_videos
  has_many :videos, through: :actors_videos
end
