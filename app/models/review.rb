class Review < ApplicationRecord
 STATUSES = ["approved", "pending", "declined"]
 validates :status, inclusion: { in: STATUSES }


  belongs_to :application
  belongs_to :user

  validates :reviewer_name, presence: true
  validates :location, presence: true
  validates :language, presence: true
  validates :reviewed_at, presence: true 
  validates :link, presence: true
  validates :rating, presence: true
  validates :title, presence: true
  validates :content, presence: true
end
