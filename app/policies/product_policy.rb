class ProductPolicy
    attr_reader :user, :product
    def initialize( current_user, product)
      
        @user = current_user
        @product = product
      end

    
    def index?
       true
    end

    def show?
        true
    end

    def create?
        @user.present?
    end

    def edit?
        @user.present?
        # @user.admin? 
        # Giống nhau
        # if @user.admin? 
        #     true
        # else  
        #     false
        # end
    end

    def update?
        @user.present?
    end

    def destroy?
        # if @user
        #     @user.admin?
        # else
        #     false
        # end
        
        
        @user.try(:admin?)
    end
end