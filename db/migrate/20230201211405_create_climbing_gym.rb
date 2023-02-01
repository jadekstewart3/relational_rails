class CreateClimbingGym < ActiveRecord::Migration[5.2]
  def change
    create_table :climbing_gyms do |t|
      t.string :name
      t.string :city
      t.integer :number_of_routes
      t.boolean :classes_offered

      t.timestamps
    end
  end
end
