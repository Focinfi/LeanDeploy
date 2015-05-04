class AddAuthorToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :author, :string, default: "读觅小编"
  end
end
