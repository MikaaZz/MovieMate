class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  validates :date, :duration, presence: true
end
