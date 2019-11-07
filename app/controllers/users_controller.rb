class UsersController < ApplicationController


  def show
    # 通过id参数查找用户, params就是从路由获取的用户要访问的资源id
    @user = User.find(params[:id])
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    p "debug #{@user.password}"
    if @user.save
      log_in @user # 注册后登录
      flash[:success] = 'welcome to the sample app!'
      p "do not redirect ?"
      redirect_to @user
    else
      p '无法保存?'
      p @user.errors
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email,
                                 :password, :password_confirmation)
  end

end
