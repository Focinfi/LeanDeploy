class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :place_id
      t.string :url

      t.timestamps null: false
    end
    
    add_index :images, :place_id
    
  end
end
