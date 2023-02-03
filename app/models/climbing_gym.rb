class ClimbingGym < ApplicationRecord
  has_many :patrons

  scope :by_created_at, -> { order(created_at: :desc) }
end