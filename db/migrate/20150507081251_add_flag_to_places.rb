class AddFlagToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :flag, :string, default: 'rich'
    add_column :places, :address, :text
    add_column :places, :contact, :text
  end
end
