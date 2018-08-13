class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception

  
  protected
  def after_sign_in_path_for(resource)
    p resource 
    if resource.admin?
      admin_product_index_path
    else 
      people_products_path
    end
  end
  
  private
  def after_sign_out_path_for(resource_or_scope)
    products_path   
  end

    private
  
    def user_not_authorized
      flash[:alert] = "Access denied."
      redirect_to (request.referrer || root_path)
    end
end
