class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :business_hours
      t.string :description

      t.timestamps null: false
    end
    
    add_index :places, [:latitude, :longitude]
    add_index :places, :name
    add_index :places, :business_hours
  end
end
