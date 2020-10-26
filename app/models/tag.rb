class Tag < ApplicationRecord
  has_one :review_tag

  validates :name, presence: true, inclusion: { in: ["Frontend", "Backend", "Design", "Good", "Bad"] }
end
