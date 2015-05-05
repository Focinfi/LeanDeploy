class ChangePictureOfTables < ActiveRecord::Migration
  def self.up
    rename_column :places, :picture, :picture_01
  end

  def self.down
    rename_column :places, :picture_01, :picture
  end
end
