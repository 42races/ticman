class RegistrationMailer < ApplicationMailer

  def email_confirmation(user_id)
    @user = User.find(user_id)
    @user.touch(:email_confirmation_sent_at)
    mail(to: @user.email, subject: I18n.t(:email_confirmation_sub))
  end
end
