class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
   if current_admin
      admin_root_path
   elsif current_end_user
      root_path
   end
  end

  def after_sign_out_path_for(resource)
    case resource
      when :admin
        new_admin_session_path
      when :end_user
        root_path
    end
  end

 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up,keys: [:name])
   devise_parameter_sanitizer.permit(:account_update,keys: [:name])
   devise_parameter_sanitizer.permit(:log_in,keys: [:name])
 end

end
