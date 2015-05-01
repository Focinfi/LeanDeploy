class CreateHtmlDescs < ActiveRecord::Migration
  def change
    create_table :html_descs do |t|
      t.integer :place_id
      t.text :html_doc

      t.timestamps null: false
    end
    
    add_index :html_descs, :place_id
  end
end
