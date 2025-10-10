class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # サインアップ時に name を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

    # 編集時（プロフィール更新）にも許可
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
