class AddCompanyNameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :company, foreign_key: true
  end
end
