class CancelledOrder < ApplicationRecord
  belongs_to :customer
  belongs_to :video
end
