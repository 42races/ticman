class RegistrationMailer < ApplicationMailer

  def email_confirmation(registration_id)
    @reg = Registration.find(registration_id)
    @reg.reset_confirmation_token!
    @reg.touch(:email_confirmation_sent_at)
    mail(to: @reg.email, subject: I18n.t(:email_confirmation_sub))
  end
end
