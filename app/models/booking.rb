class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  has_many :reviews
  validates :date, :duration, presence: true
end
