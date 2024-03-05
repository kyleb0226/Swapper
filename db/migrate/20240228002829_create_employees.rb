class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :company_name
      t.string :employee_name
      t.string :job_title
      t.string :job_code
      t.integer :current_location_id
      t.integer :desired_location_id
      t.integer :seniority

      t.timestamps
    end
  end
end
