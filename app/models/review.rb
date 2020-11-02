class Review < ApplicationRecord
  STATUSES = ["approved", "pending", "declined"]
  validates :status, inclusion: { in: STATUSES }
  belongs_to :application
  belongs_to :user
  has_many :review_tags
  has_many :tags, through: :review_tags
  validates :reviewer_name, presence: true
  validates :location, presence: true
  validates :language, presence: true
  validates :reviewed_at, presence: true
  validates :link, presence: true
  validates :rating, presence: true
  validates :title, presence: true
  validates :content, presence: true

  after_update :send_notification

  def send_notification
    ReviewServices::SlackNotification.new.build_message(title, content, rating).deliver
  end
end
