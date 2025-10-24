class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

  # 現在ログインしているユーザーを取得
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # ログインしているかどうか
  def logged_in?
    current_user.present?
  end

  # ログインしていない場合はログイン画面へリダイレクト
  def require_login
    unless logged_in?
      redirect_to login_path, alert: "ログインしてください"
    end
  end
end
