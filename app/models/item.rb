class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :find, dependent: :destroy

  geocoded_by :address
  after_validation :geocode

  validates :name, presence: true
  validates :address, presence: true
  validates :latitude, presence: true
  validates :studios, presence: true
  validates :image, presence: true
end
