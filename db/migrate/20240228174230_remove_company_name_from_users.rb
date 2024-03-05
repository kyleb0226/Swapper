class RemoveCompanyNameFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :company_name, :string
  end
end
