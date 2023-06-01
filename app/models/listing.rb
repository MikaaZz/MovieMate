class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  validates :title, :description, :price, :location, :category, presence: true
  include PgSearch::Model
  pg_search_scope :search_by_title_description_location_category,
                  against: %i[title description location category],
                  using: {
                    tsearch: { prefix: true }
                  }
end
