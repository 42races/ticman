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
      RegistrationMailer.email_confirmation(@user.id).deliver_now
    else
      render 'new'
    end
  end

  def confirm_email
    @user = load_user

    if @user.present?
      if @user.confirm_email!

        # create an organization and add the user as admin to organization.
        Organization.provision!(@user)

        redirect_to edit_password_path(@user), notice: 'Email confimed successfully'
      else
        redirect_to root_path, notice: 'Email already confirmed please login.'
      end
    else
      render :wrong_confirmation_token
    end
  end

  private

  def registration_params
    # the name will be organization name during the registration
    params.require(:user).permit(:email, :name)
  end

  def load_user
    return nil if params[:email_confirmation_token].blank?
    @user = User.where(email_confirmation_token: params[:email_confirmation_token]).first
  end
end
