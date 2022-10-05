class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def check_is_admin
    unless current_user.is_admin?
      redirect_to root_path, alert: "Você não tem acesso a essa página!"
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
