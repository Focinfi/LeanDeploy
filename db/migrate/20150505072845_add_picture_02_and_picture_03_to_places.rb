class AddPicture02AndPicture03ToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :picture_02, :string
    add_column :places, :picture_03, :string
  end
end
