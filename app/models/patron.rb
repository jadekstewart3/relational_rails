class Patron < ApplicationRecord
  belongs_to :climbing_gym

  scope :is_belay_certified, -> { where("belay_certified") }
end