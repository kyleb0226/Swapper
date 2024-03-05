class CreateCompletedMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :completed_matches do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :matched_employee, null: false, foreign_key: true
      t.string :match_type

      t.timestamps
    end
  end
end
