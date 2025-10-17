class SessionsController < ApplicationController
  def new
  end

 def create
  user = User.find_by(name: params[:name])

  if user&.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to posts_path, notice: "ログインしました！"
  else
    flash.now[:alert] = "名前またはパスワードが間違っています"
    render :new, status: :unprocessable_entity
  end
end


  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "ログアウトしました"
  end
end
