class MypageController < ApplicationController
  def top
  end


  def mypage
    @user = current_user 
  end 


end
