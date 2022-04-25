class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_end_user
  before_action :set_current_admin

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
# アクセス権限
  def autheniticate_end_user
    if @current_end_user == nil
      flash[:notice] = "閲覧には、ログインが必要です"
      redirect_to  new_end_user_session_path
    end
  end

  def autheniticate_admin
    if @current_admin == nil
      flash[:notice] = "閲覧には、ログインが必要です"
      redirect_to   new_admin_session_path
    end
  end

 protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:name])
    devise_parameter_sanitizer.permit(:account_update,keys: [:name])
    devise_parameter_sanitizer.permit(:log_in,keys: [:name])
  end

  def set_current_end_user
    @current_end_user = current_end_user
  end

  def set_current_admin
    @current_admin = current_admin
  end

end
