class AddCompletedToMatches < ActiveRecord::Migration[7.1]
  def change
    add_column :matches, :completed, :boolean
  end
end
