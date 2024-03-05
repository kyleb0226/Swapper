class MainController < ApplicationController
    def index
      #flash[:notice]="Logged In Successfully"
      #flash[:alert]="Incorrect Email or Password"
      if session[:user_id]
        @user=User.find(session[:user_id])
      end
    end
end
