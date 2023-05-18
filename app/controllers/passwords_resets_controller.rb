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
end