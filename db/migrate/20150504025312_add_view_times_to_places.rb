class AddViewTimesToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :view_times, :integer, default: 0
  end
end
