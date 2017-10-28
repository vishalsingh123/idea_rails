class RegistrationsController < Devise::RegistrationsController

private
  def sign_up_params
    params.require(:user).permit(:firstName, :lastName, :email, :password, :password_confirmation, :avatar, :telephone)
  end

  def account_update_params
    params.require(:user).permit(:firstName, :lastName, :email, :password, :password_confirmation, :current_password, :avatar, :telephone)
  end

end
