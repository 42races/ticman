class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.where(email: login_params[:email]).first

    if @user && @user.authenticate(login_params[:password])
      set_user_login_session
      redirect_to home_path
    else
      redirect_to :back
    end
  end

  def destroy
    session.clear
    redirect_to home_path
  end

  private

  def login_params
    params.require(:session).permit(:email, :password)
  end

  def set_user_login_session
    session[:user_id] = @user.id
  end
end