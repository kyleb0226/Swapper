# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end






Location.create(name: "Downtown", company_id: 5)
Location.create(name: "Uptown", company_id: 5)
Location.create(name: "Countryside", company_id: 5)
Location.create(name: "Seaside", company_id: 5)
Location.create(name: "Mountains", company_id: 5)
Location.create(name: "Valley", company_id: 5)
Location.create(name: "Desert", company_id: 5)
Location.create(name: "Forest", company_id: 5)
Location.create(name: "Island", company_id: 5)
Location.create(name: "Lakefront", company_id: 5)


require 'faker'

# Define job titles and job codes
job_titles = ["engineer", "coder", "dentist", "doctor", "trash man"]
job_codes = ["1", "2", "3", "4", "5"]

# Shuffle the locations to ensure randomness
shuffled_locations = Location.all.shuffle

# Generate 100 random employees


100.times do
    name = Faker::Name.unique.first_name
    job_title = job_titles.sample
    job_code = job_codes.sample
    seniority = rand(1..50)
  
    # Pair up shuffled locations to assign current and desired locations alternately
    current_location = shuffled_locations.pop
    desired_location = shuffled_locations.pop
  
    Employee.create(
      employee_name: name,
      company_name: "swapper",
      job_title: job_title,
      job_code: job_code,
      current_location: current_location,
      desired_location: desired_location,
      seniority: seniority
    )
  end
#make comparipason alg more efficient


