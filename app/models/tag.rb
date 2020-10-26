class Tag < ApplicationRecord
  has_one :review_tag
  # should we use "through" or not ?

  validates :name, presence: true, inclusion: { in: ["Frontend", "Backend", "Design", "Good", "Bad"] }
end
