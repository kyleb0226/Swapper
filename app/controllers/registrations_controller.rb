class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  
    company = Company.find_by(company_name: params[:user][:company_name])
  
    if company.nil?
      # If the company doesn't exist, create it first
      company = Company.create(company_name: params[:user][:company_name])
    end
  
    # Assign the company_id to the user
    @user.company_id = company.id
  
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Account Created!"
    else 
      render :new
    end
  end
  

  private 

  def user_params
    params.require(:user).permit(:email,:password,:password_confirmation,:company_name)
  end

end