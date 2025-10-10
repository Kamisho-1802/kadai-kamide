class MypagesController < ApplicationController
  before_action :authenticate_user!  # ログインしていない場合はトップへリダイレクト
  before_action :set_user

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to mypage_path(@user), notice: "プロフィールを更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :content)
  end
end
