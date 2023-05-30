class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  validates :title, :description, :price, :location, :category, presence: true
end
