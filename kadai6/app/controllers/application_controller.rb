class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

  # ログイン中のユーザーを返す
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # ログインしているか確認
  def logged_in?
    current_user.present?
  end

  # ログインしていなければログインページへリダイレクト
  def require_login
    unless logged_in?
      redirect_to login_path, alert: "ログインしてください"
    end
  end
end
