class EmployeeDatabaseController < ApplicationController
    def new
      @user = Current.user#not sure if i need this or not
    end

    def create

        @employee = Employee.new(employee_params)
        @employee.company_name = Current.user.company_name#force employee to be same compnay as user that adds
        if @employee.save
            check_for_match(@employee,0)
            redirect_to root_path, notice: "Employee was successfully created."
        else
            #flash.now[:alert] = @employee.errors.full_messages.join(". ")
            flash.now[:alert] = "<div class='alert alert-danger' role='alert'>#{view_context.content_tag(:strong, 'Please fix the following errors:')}<br>#{view_context.content_tag(:ul, @employee.errors.full_messages.map { |msg| view_context.content_tag(:li, msg) }.join.html_safe)}</div>".html_safe

            render :new
        #employee_database_path, alert: "success"
        end
    end

    def destroy

    end

    private

  def employee_params
    params.require(:employee).permit(:employee_name, :job_title, :job_code, :current_location_id, :desired_location_id, :seniority)
  end

  #see if employee is a match and if so, add a record to match table
  
  def check_for_match(new_employee)
    #employees = Employee.where(company_name: new_employee.company_name)
    employees = Employee.where(company_name: new_employee.company_name, job_title: new_employee.job_title)
    
    for i in 0..employees.length-1
      employee = employees[i]
      # Check if locations match
      desired_location = Location.find(employee.desired_location_id)#locations of array employee
      current_location = Location.find(employee.current_location_id)
      
      new_desired_location = Location.find(new_employee.desired_location_id)#locations of passed in employee
      new_current_location = Location.find(new_employee.current_location_id)
      if !(new_desired_location.name == current_location.name && desired_location.name == new_current_location.name)
        next
      end

      if(current_location.name==new_current_location.name)
        next
      end
      
        # Check if record doesn't exist already
      if Match.where("(employee_id = :employee1_id AND matched_employee_id = :employee2_id) ",{ employee1_id: employee.id, employee2_id: new_employee.id }).exists?
        next
      end 
      if Match.where("(employee_id = :employee2_id AND matched_employee_id = :employee1_id) ",{ employee1_id: employee.id, employee2_id: new_employee.id }).exists?
        next
      end

      if employee.job_code == new_employee.job_code
        Match.create(employee_id: employee.id, matched_employee_id: new_employee.id, match_type: "job code", completed: false)    
      else
        Match.create(employee_id: employee.id, matched_employee_id: new_employee.id, match_type: "job title", completed: false)
      end
    end
  
  end 
  
end
