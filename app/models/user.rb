class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true

  has_one_attached :photo
  has_many :listings, dependent: :destroy
  has_many :bookings, dependent: :destroy
end
