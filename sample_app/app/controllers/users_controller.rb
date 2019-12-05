class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) #paramsで:idパラメータを受け取る(/user/1にアクセスしたら1を受け取る)
  end

  def new
    @user = User.new
  end

  def create #POST
    @user = User.new(user_params)
    if @user.save
      redirect_to @user #redirect_to user_url(id: @user.id)
      flash[:success] = "Welcom to the Sample App!"
    else
      render 'new' #保存が失敗したらnewビューに戻す
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
