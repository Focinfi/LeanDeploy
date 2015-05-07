class AddDefaultValueToPlaces < ActiveRecord::Migration
  def change
    change_column :places, :latitude, :string, default: 32.1119
    change_column :places, :longitude, :string, default: 118.932
  end
end
