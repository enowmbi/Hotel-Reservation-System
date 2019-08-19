class Room < ApplicationRecord
  belongs_to :room_category

  validates :room_number,presence: true
  validates :room_number, uniqueness: true
  validates :description, presence: true

end
