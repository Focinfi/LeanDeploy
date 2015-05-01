class CreateHtmlUrls < ActiveRecord::Migration
  def change
    create_table :html_urls do |t|
      t.integer :place_id
      t.string :url

      t.timestamps null: false
    end
    
    add_index :html_urls, :place_id
  end
end
