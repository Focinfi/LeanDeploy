class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.text :description
      t.string :imgUrl
      t.float :longtitude
      t.float :latitude
      t.string :intro
      t.text :html
      t.string :author

      t.timestamps null: false
    end
  end
end
