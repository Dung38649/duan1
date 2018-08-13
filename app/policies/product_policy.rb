class ProductPolicy
    attr_reader :user, :product
    def initialize user, product
        @user = user
        @product = product
      end

    
    def index?
       true
    end

    def show?
        true
    end

    def create?
        @user == @user || @user.admin?
    end

    def edit?
        @user.admin? || @user == @user

        # Giống nhau
        # if @user.admin? 
        #     true
        # else  
        #     false
        # end
    end

    def update?
        @user == @user || @user.admin?
    end

    def destroy
        @user.admin?
    end
end