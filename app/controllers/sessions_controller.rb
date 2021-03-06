class SessionsController < ApplicationController
  def new

  end


  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user # register session id
      # 登入用户，然后重定向到资料
      redirect_to user


    else
      # 创建一个错误消息
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end


  def destroy
    log_out
    redirect_to root_path
  end
end
