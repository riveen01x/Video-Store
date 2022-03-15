class Waitlist < ApplicationRecord
  validates :email, uniqueness: { scope: :video_id }
end
