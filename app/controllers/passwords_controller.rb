class PasswordsController < ApplicationController

  before_action :load_user

  def edit
  end

  def update
    if @user.update_attributes(password_params)
      redirect_to home_path, notice: 'Password updated successfully'
    else
      render :edit
    end
  end

  private

  def load_user
    @user = User.where(id: params[:id]).first
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end