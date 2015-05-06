class AddCategoryToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :category, :string, defult: "其他"
  end
end
