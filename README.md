# README
# Swapper

Welcome to the Swapper! This application is designed to facilitate the process of employees swapping locations based on their preferences and qualifications.

## Getting Started

### Prerequisites

- Ruby version 3.3.0
- Rails version 7.1.3

### Installation

1. Clone the repository: git clone https://github.com/kyleb0226/Swapper.git



2. Install dependancies: bundle install



3. Set up the database: rails db:create
                        rails db:migrate
                        rails db:seed

4. Start server: rails s 


5. Access the application at `http://localhost:3000` in your web browser.

## Usage

### Adding Employees

1. Log in to the application using your credentials.
2. Navigate to the "Employees" section.
3. Click on "Add Employee" to add a new employee.
4. Enter the employee's details, including name, current location, desired location, qualifications, and preferences.

### Comparing Employees

1. Navigate to the "Match Employees" section.
2. The application will automatically analyze the employee data to identify potential swap candidates based on location compatibility, qualifications, and preferences.
3. Review the list of swap candidates and take appropriate action by confirming the matches.

### Managing Employees

1. Navigate to the "Employees" section to view, edit, or delete existing employee records.
2. Use the search and filter functionality to find

### Ruby Version

This application requires Ruby version 3.3.0. You can install Ruby using your preferred package manager or through [ruby-lang.org](https://www.ruby-lang.org/).

### System Dependencies

- Ruby on Rails

### Configuration

No additional configuration is required for basic functionality. However, you may customize the application settings as needed in the configuration files.

### Database

This application uses SQLlite as the database. 

### Testing

To run the test suite, execute the following command:


