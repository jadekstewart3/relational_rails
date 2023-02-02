class CreatePatrons < ActiveRecord::Migration[5.2]
  def change
    create_table :patrons do |t|
      t.string :name
      t.integer :years_member
      t.boolean :belay_certified
      t.references :climbing_gym, foreign_key: true

      t.timestamps
    end
  end
end
