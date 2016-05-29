class RegistrationMailer < ApplicationMailer

  def email_confirmation(registration_id)
    @reg = Registration.find(registration_id)
    @reg.reset_confirmation_token
    @reg.touch(:email_confirmation_sent_at)
    @reg.registration_email_count = @reg.registration_email_count + 1
    @reg.save

    mail(to: @reg.email, subject: I18n.t(:email_confirmation_sub))
  end
end
