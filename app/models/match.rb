class Match < ApplicationRecord
    belongs_to :employee
    belongs_to :matched_employee , class_name: 'Employee'
end