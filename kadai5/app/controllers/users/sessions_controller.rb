class Users::SessionsController < Devise::SessionsController
  # ログイン処理を name + password で行う
  def create
    user = User.find_by(name: params[:user][:name])
    if user && user.valid_password?(params[:user][:password])
      sign_in user
      redirect_to mypage_path(user)
    else
      flash[:alert] = '名前またはパスワードが間違っています'
      redirect_to new_user_session_path
    end
  end
end
