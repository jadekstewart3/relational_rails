class AddClimbingGymToPatrons < ActiveRecord::Migration[5.2]
  def change
    add_reference :patrons, :climbing_gym, foreign_key: true
  end
end
