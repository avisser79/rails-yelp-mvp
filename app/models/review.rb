class Review < ApplicationRecord
  belongs_to :restaurant
  validates :rating, numericality: true, inclusion: { in: [0, 1, 2, 3, 4, 5], allow_nil: false },  presence: true
  validates :content, presence: true
end
