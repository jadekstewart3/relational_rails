class CreatePatrons < ActiveRecord::Migration[5.2]
  def change
    create_table :patrons do |t|
      t.integer :gym_id
      t.string :name
      t.boolean :belay_certified

      t.timestamps
    end
  end
end
