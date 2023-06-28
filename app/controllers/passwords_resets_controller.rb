class PasswordsResetsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user.present?
            PasswordMailer.with(user: @user).reset.deliver_now
        end
        redirect_to root_path, notice: "If your account exist in our database then go and check your email for further instructions"
    end

    def edit
        @user = User.find_signed!(params[:token], purpose: "reset_password")
        
        rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to password_reset_path, alert: "Your token has expired. Please try again"
    end

    def update
        @user = User.find_signed!(params[:token], purpose: "reset_password")
        if  @user.update(password_params)
            redirect_to login_path, notice: "Your password was reset successfully. You can now log in"
        else
            render :edit
        end
    end

    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end