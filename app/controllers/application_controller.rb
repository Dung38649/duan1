class ApplicationController < ActionController::Base
  include Pundit  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit({ roles: [] }, :email, :password, :password_confirmation, :name)
    end
  end

  protected
  def after_sign_in_path_for(resource)
    p resource 
    if resource.admin?
      admin_products_path
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
