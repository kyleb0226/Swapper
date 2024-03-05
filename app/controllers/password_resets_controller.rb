class PasswordResetsController < ApplicationController

    def new

    end

    def create
        @user=User.find_by(email: params[:email])

        if @user.present?
            #send email
            PasswordMailer.with(user: @user).reset.deliver_now #password mailer has params too, and the meial shou;d be sent in background to not overload and to make website slow
        end
        redirect_to root_path, notice: "A link has been sent to your email if associated with an account"
    end 
    def edit
        @user=User.find_signed(params[:token],purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature# if link is expired
        redirect_to sign_in_path, alert: "Token has expired, please request another reset link."
    end

    def update
        @user=User.find_signed(params[:token],purpose: "password_reset")
        if @user.update(password_params)
            redirect_to sign_in_path, notice: "Password reset successfully!"
        else
            render :edit
        end

    end
    private 
    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end 
end
