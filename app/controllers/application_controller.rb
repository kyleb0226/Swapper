class ApplicationController < ActionController::Base
    before_action :set_current_user#runs with prioroty
    def set_current_user
        if session[:user_id]
            Current.user=User.find_by(id:session[:user_id])#user current instead of @user
    end
end

    def require_user_logged_in
        redirect_to sign_in_path, alert:"Sign in first to edit password" if Current.user.nil?
    end
end
