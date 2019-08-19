class RoomCategory < ApplicationRecord
  has_many :rooms, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 1}
end
