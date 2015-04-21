class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :place_id
      t.text :content
      t.string :userId

      t.timestamps null: false
    end
  end
end
