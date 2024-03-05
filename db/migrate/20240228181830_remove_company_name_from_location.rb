class RemoveCompanyNameFromLocation < ActiveRecord::Migration[7.1]
  def change
    remove_column :locations, :company_name, :string
  end
end
