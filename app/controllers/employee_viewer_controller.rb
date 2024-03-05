class EmployeeViewerController < ApplicationController
    def index
        #@employees = Employee.all
        @job_titles = Employee.where(company_name: Current.user.company_name).pluck(:job_title).uniq
        #@locations = Location.where(name: Current.user.company_name).pluck(:name) # You also need to set @locations similarly
        #@locations=Location.where(company_id: Current.user.company_name).pluck(:name).uniq
        @locations = Location.where(company_id: Current.user.company_id).pluck(:name).uniq

        @employees = Employee.where(company_name: Current.user.company_name)
        @job_codes = Employee.where(company_name: Current.user.company_name).pluck(:job_code).uniq
        # Assuming your view file is named index.html.erb
  
        @employees = @employees.where(job_title: params[:job_title_filter]) if params[:job_title_filter].present?
        @employees = @employees.where(job_code: params[:job_code_filter]) if params[:job_code_filter].present?
    # Apply filters if they are present in the params
        if params[:current_location_filter].present? && params[:desired_location_filter].present?
            @employees = @employees.joins(:current_location, :desired_location)
                                .where("current_location_id IN (SELECT id FROM locations WHERE name = ?)", params[:current_location_filter])
                                .where("desired_location_id IN (SELECT id FROM locations WHERE name = ?)", params[:desired_location_filter])
        
        else
            @employees = @employees.where(job_title: params[:job_title_filter]) if params[:job_title_filter].present?
            @employees = @employees.where(job_code: params[:job_code_filter]) if params[:job_code_filter].present?
            @employees = @employees.joins(:current_location).where("locations.name = ?", params[:current_location_filter]) if params[:current_location_filter].present?
            @employees = @employees.joins(:desired_location).where("locations.name = ?", params[:desired_location_filter]) if params[:desired_location_filter].present?
        end
      
    


          
       
        #@employees = @employees.where(job_title: params[:job_title_filter]) if params[:job_title_filter].present?
        #@employees = @employees.where(job_code: params[:job_code_filter]) if params[:job_code_filter].present?
        #@employees = @employees.joins(:current_location).where(locations: { name: params[:current_location_filter] }) if params[:current_location_filter].present?                
        #@employees = @employees.joins(:desired_location).where(locations: { name: params[:desired_location_filter] }) if params[:desired_location_filter].present?
        render :index 
          
      end

end
