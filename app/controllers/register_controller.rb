class RegisterController < ApplicationController
    def new
        @user = User.new()
    end
    
    def create
        @user = User.new(user_params)
        @user[:email].downcase
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Successfully created"
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end