class ClimbingGym < ApplicationRecord
  has_many :patrons, :dependent => :destroy

  scope :by_created_at, -> { order(created_at: :desc) }
end