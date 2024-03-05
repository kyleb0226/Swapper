class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.integer :employee_id
      t.integer :matched_employee_id

      t.timestamps
    end
  end
end
