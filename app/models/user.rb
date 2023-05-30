class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_one_attached :photo
  has_many :listings, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :first_name, :last_name, :email, presence: true
end
