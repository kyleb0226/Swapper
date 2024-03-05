#class inherits from employee database controller for the check_for_match function

class EmployeeMatchController < EmployeeDatabaseController  
    def create
        @matches = Match.all
        puts "---------=--------=------=------",params.inspect,"-----=------------=-------------=-------"
      
        # Apply filtering based on Match Type
        if params[:job_title_filter].present?
          case params[:job_title_filter]
          when "title"
            @matches = @matches.where(match_type: "job title")
          when "code"
            @matches = @matches.where(match_type: "job code")
          end
        end
      
        # Apply filtering based on Match Status
        if params[:match_status_filter].present?
          case params[:match_status_filter]
          when "completed"
            @matches = @matches.where(completed: true)
          when "incompleted"
            @matches = @matches.where(completed: false)
          end
        end
      
        # Render the view
        render :create

    end




      
     
      
      


      #probably useless function, just kepy around incase, but idea was 2 have 2 tables, one with matches and other with 
      #completed matches but i just added status attribute on matches  instead
    def destroy
        match = Match.find(params[:id])
        #CompletedMatch.create(employee_id: match.employee_id, matched_employee_id: match.matched_employee_id, match_type: match.match_type)
        #CompletedMatch.create(employee_id: match.employee_id, match_type: match.match_type)
        CompletedMatch.create(employee_id: match.employee_id, matched_employee_id: match.matched_employee_id, match_type: match.match_type)
        # Find and destroy the associated employees
        employee1 = match.employee
        employee2 = match.matched_employee
        #employee1.destroy
        #employee2.destroy
        # Create a completed match record
        #CompletedMatch.create(employee_id: match.employee_id, matched_employee_id: match.matched_employee_id, match_type: match.match_type)

        # Delete the Match record
        #match.destroy

        redirect_to employee_match_path, notice: "Match successfully completed!"

    end

    def complete
        @match = Match.find(params[:id])
        @match.update(completed: true)
        check_for_new_non_matches()
        redirect_to employee_match_path, notice: 'Match completed successfully.'
    end

    def uncomplete
        @match = Match.find(params[:id])
        @match.update(completed: false)
        recheck_for_new_matches()
        redirect_to employee_match_path, notice: 'Match successfully unpaired.'
        
    end

    def manual 
        @employees = Employee.where(company_name: Current.user.company_name)
        #@employees=Employee.all
        x=0
        @employees.each do |employee| 
            check_for_match(employee)
            print employee.employee_name
            x+=1
        end
        redirect_to employee_match_path, notice: 'Manual matching process completed.'
    end

    def update
    end



    def show

    end
    private
    #function is meant to be called after a match is unpaired
    #both of the employees in the match must be rechecked if they match with any other employee in the system
    def recheck_for_new_matches
        employee1 = Employee.find_by(id: @match.employee_id)
        employee2 = Employee.find_by(id: @match.matched_employee_id)
        @match.destroy #deletes match in the system
        check_for_match(employee1)
        check_for_match(employee2)

    end

    #this function is handles when a match is made, if their are non unpaired people then their match will be destroyed
    def check_for_new_non_matches
        employee1 =@match.employee_id
        employee2 =@match.matched_employee_id
        #check every record in the database for if they are matched with one of the numbers, if yes then destroy
        matches_to_destroy = Match.where("employee_id = ? OR matched_employee_id = ?", employee1, employee2).where.not(id: @match.id).destroy_all
        Match.where("employee_id = ? OR matched_employee_id = ?", employee2, employee1).where.not(id: @match.id).destroy_all
    end

end

