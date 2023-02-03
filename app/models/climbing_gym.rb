class ClimbingGym < ApplicationRecord
  has_many :patrons

  def self.sort
    ClimbingGym.order(created_at: :asc)
  end
end