class Review < ApplicationRecord
  belongs_to :bookings
  belongs_to :users
end
