class Application < ApplicationRecord
  has_many :reviews
  has_many :users
  validates :name, presence: true, uniqueness: true
  has_one_attached :photo
end
