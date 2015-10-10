class RegistrationsController < ApplicationController
  # organization registration

  def new
    @user = User.new
  end

  def create
    @user = User.build_new_user(registration_params.merge(role: 'admin'))
    if @user.save
      # First user will be the admin user of the organization
      # he will have to click the email confirmation to activate
      # organization account.
    else
      render 'new'
    end
  end

  private

  def registration_params
    # the name will be organization name during the registration
    params.require(:user).permit(:email, :name)
  end
end
