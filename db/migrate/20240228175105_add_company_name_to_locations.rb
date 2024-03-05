class AddCompanyNameToLocations < ActiveRecord::Migration[7.1]
  def change
    add_column :locations, :company_name, :string
    add_reference :locations, :company, foreign_key: true
  end
end
