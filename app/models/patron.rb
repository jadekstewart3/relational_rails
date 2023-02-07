class Patron < ApplicationRecord
  belongs_to :climbing_gym

  scope :is_belay_certified, -> { where("belay_certified") }
  
  scope :sort_alphabetically, -> { order(name: :asc) }

  def self.filter_patrons(int)
    where("years_member > #{int}")
  end
end