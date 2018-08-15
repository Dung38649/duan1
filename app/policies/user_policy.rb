class UserPolicy
    attr_reader :current_user, :model
  
    def initialize(current_user, model)
      @current_user = current_user
      @user = model
    end
  
    def index?
      @current_user.admin?
    end

    def show?
      @current_user.admin? || @current_user == @user
    end
  
    def update?
      # return true if @current_user.admin?
      if @user.admin?
        @user == @current_user
      else
        @current_user.admin?
      end
    end
  
    def destroy?
      return false if @current_user == @user || @user.admin?
      @current_user.admin?
    end
  
  end