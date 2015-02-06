class RegistrationsController < Devise::RegistrationsController

  protected
  def after_sign_up_path_for(resource)
    promos_dashboard_path
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :role)
  end
  
end
