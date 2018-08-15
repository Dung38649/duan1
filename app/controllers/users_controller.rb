class UsersController < ApplicationController

    before_action :authenticate_user!


    def new
      @user = User.new
    end
  
    def index
      @users = User.all
      authorize User
    end
  
    def show
      @user = User.find(params[:id])
      authorize @user
    end

    def update
      @user = User.find(params[:id])
      authorize @user
      @user.assign_attributes(secure_params)

      if (@user.changed_attributes[:role] && @user.changed_attributes[:role] == "admin" && User.count_admin > 1)
        @user.update_attributes(secure_params)
        redirect_to people_products_path, :notice => "User updated."
      elsif (@user.changed_attributes[:role] && @user.changed_attributes[:role] != "admin" )
        @user.update_attributes(secure_params)
        redirect_to users_path, :notice => "User updated."
      else
        redirect_to users_path, :alert => "Unable to update user."
      end
     
    end 
  
    def destroy

      @user = User.find(params[:id])

      authorize @user
      
      @user.destroy
      redirect_to users_path, :notice => "User deleted."
    end
  
    private
  
    def secure_params
      params.require(:user).permit(:role)
    end
    
end
