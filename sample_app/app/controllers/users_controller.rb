class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) #paramsで:idパラメータを受け取る(/user/1にアクセスしたら1を受け取る)
  end

  def new
  end
end
