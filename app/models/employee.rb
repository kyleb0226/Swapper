# app/models/employee.rb

class Employee < ApplicationRecord
    belongs_to :current_location, class_name: "Location", foreign_key: "current_location_id"
    belongs_to :desired_location, class_name: "Location", foreign_key: "desired_location_id"
  
    validates :employee_name, presence: { message: "Employee name can't be blank" }
    validates :company_name, presence: { message: "Company name can't be blank" }
    validates :job_title, presence: { message: "Job title can't be blank" }
    validates :job_code, presence: { message: "Job code can't be blank" }
    validates :current_location_id, presence: { message: "Current location can't be blank" }
    validates :desired_location_id, presence: { message: "Desired location can't be blank" }
    validates :seniority, presence: { message: "Seniority can't be blank" }

  end
  
      
  
    # Other validations, associations, and methods can be added here as needed
  
  