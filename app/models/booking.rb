class Booking < ApplicationRecord
  belongs_to :listings
  belongs_to :users
end
