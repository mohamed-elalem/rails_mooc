class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # load_and_authorize_resource
  # check_authorization
  before_action :authenticated_user!, except: [:index, :show]
  before_action :configure_permitted_parameters, if: :devise_controller?

 

  rescue_from SecurityError do |exception|
    redirect_to root_url
  end

  def authenticate_admin_user!
    raise SecurityError unless current_user.try(:admin?)
  end

  def authenticated_user!
    # abort((request.methods - Object.methods).inspect)
    # abort(devise_controller?)
    raise SecurityError unless user_signed_in? || devise_controller?
    authenticate_user!
  end

  def after_sign_in_path_for(resource)
    puts current_user
    if current_user.admin?
      admin_root_url
    else
      root_url
    end
  end 

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :password, :password_confirmation, :role])
  end


end
