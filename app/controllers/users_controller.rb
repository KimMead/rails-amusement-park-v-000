class UsersController < ApplicationController

    def new
      @user = User.new 
    end
  
    def create
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end 
  
    def show    
      @user = User.find_by(id: params[:id])
      if !current_user.admin 
        if current_user != @user 
          redirect_to root_path
        end
      end   
    end
  
    def update
      redirect_to user_path(@current_user)
    end
  
    private
  
    def user_params
      params.require(:user).permit(
        :name,
        :height,
        :happiness,
        :nausea,
        :tickets,
        :password,
      )
    end
end 