class PasswordsController < ApplicationController

  before_action :load_user

  def edit
  end

  def update
    if @user.update_attribute(password_params)
      redirect_to home_page, notice: 'Password updated successfully'
    else
      render :edit
    end
  end

  private

  def load_user
    @user = User.where(id: params[:id])
  end
end