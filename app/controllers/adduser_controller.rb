class AdduserController < ApplicationController
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
            #session[:user_id] = @user.id  
            redirect_to adduser_path, notice: "Successfully created account"
        else
            redirect_to adduser_path, notice: "User already exists"
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end