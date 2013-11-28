class User::ParameterSanitizer < Devise::ParameterSanitizer
  def sign_in
    default_params.permit(:email, :password)
  end

  def sign_up
    default_params.permit(:email, :password, :password_confirmation)
  end

  def account_update
    default_params.permit(:email, :password, :password_confirmation, :current_password, :given_name, :family_name, :delivery_address, :billing_address, :phone)
  end
end