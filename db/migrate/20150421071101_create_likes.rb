class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :place_id
      t.string :userId

      t.timestamps null: false
    end
  end
end
