class ClimbingGym < ApplicationRecord
  has_many :patrons

  def self.sort
    ClimbingGym.order(created_at: :desc)
  end
end