class SessionsController < ApplicationController
    def destroy
        session[:user_id] = nil
        redirect_to login_path, notice: "logged out"
    end

    def new
    end

    def create 
        user = User.find_by(username: params[:username])

        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            if user.username =="admin"
                redirect_to main_path, notice: "logged in successfully"
            else
                redirect_to shodan_path, notice: "logged in successfully"
            end
        else
            flash[:alert] = "Invalid username or password"
            render :new
        end 
    end 
end  