class RegistrationsController < ApplicationController
  rescue_from InvalidEmailToken, with: :invalid_email_token

  def index
    @registrations = Registration.all
  end

  def new
    @reg = Registration.new
  end

  def create
    @reg = Registration.new(registration_params)
    @reg.set_confirmation_token

    if @reg.save
      RegistrationMailer.email_confirmation(@reg.id).deliver_now
    else
      render 'new'
    end
  end

  def confirm_email
    load_registration

    if @reg.expired?
      redirect_to root_path, notice: I18n.t(:email_token_expired)
    elsif @reg.confirm!
      Organization.provision!(@reg)
      redirect_to edit_password_path(@reg), notice: I18n.t(:email_confirmed)
    else
      redirect_to root_path, notice: I18n.t(:email_already_confirmed)
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:email, :organization_name)
  end

  def load_registration
    return nil if params[:email_confirmation_token].blank?
    @reg = Registration.where(email_confirmation_token: params[:email_confirmation_token]).first
    raise InvalidEmailToken if @reg.blank?
  end

  def invalid_email_token
    redirect_to root_path, notice: I18n.t(:invalid_email_token)
  end
end
