class RegistrationsController < ApplicationController
  # organization registration

  def index
    @registrations = Registration.all
  end

  def new
    @reg = Registration.new
  end

  def create
    @reg = Registration.new(registration_params)

    if @reg.save
      RegistrationMailer.email_confirmation(@reg.id).deliver_now
    else
      render 'new'
    end
  end

  def confirm_email
    @reg = load_registration

    if @reg.present?

      if @reg.confirm_email!
        redirect_to edit_password_path(@reg), notice: 'Email confimed successfully'
      else
        redirect_to root_path, notice: 'Email already confirmed please login.'
      end
    else
      render :wrong_confirmation_token
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:email, :organization_name)
  end

  def load_registration
    return nil if params[:email_confirmation_token].blank?
    @reg = Registration.where(email_confirmation_token: params[:email_confirmation_token]).first
  end
end
