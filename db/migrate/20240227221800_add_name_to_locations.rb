class AddNameToLocations < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:locations, :name)
      add_column :locations, :name, :string
    end
  end
end

