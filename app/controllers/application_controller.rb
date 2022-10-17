class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def after_sign_in_path_for(resource)
    index_path
  end

  def check_is_admin
    unless current_user.is_admin?
      redirect_to index_path, alert: "Você não tem acesso a essa página!"
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
