class Tag < ApplicationRecord
  has_one :review_tag
  # should we use "through" or not ?
  has_many :reviews, through: :review_tag
  validates :name, presence: true, inclusion: { in: ["Frontend", "Backend", "Design", "Good", "Bad"] }
end
