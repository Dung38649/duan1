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
      if (current_user.admin? == true || @user.admin == "1" )

      else

      if @user.update_attributes(secure_params)
        redirect_to users_path, :notice => "User updated."
      else
        redirect_to users_path, :alert => "Unable to update user."
      end
    end 
  
    def destroy
      user = User.find(params[:id])
      authorize user
      user.destroy
      redirect_to edit_product_path, :notice => "User deleted."
    end
  
    private
  
    def secure_params
      params.require(:user).permit(:role)
    end
    
end
