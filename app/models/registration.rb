class Registration < ActiveRecord::Base

  validates :organization_name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :email_confirmation_token, uniqueness: true, presence: true

  belongs_to :user
  belongs_to :organization


  def confirm!
    touch(:confirmed_at) if !confirmed?
  end

  def expired?
    !confirmed? && (email_confirmation_sent_at < 24.hours.ago)
  end

  def confirmed?
    confirmed_at.present?
  end

  def set_confirmation_token
    self.email_confirmation_token = Service.reference_code(email)
  end

  def reset_confirmation_token
    self.email_confirmation_token = Service.reference_code(email)
  end

  def mark_as_registered!(org, admin)
    self.organization = org
    self.user         = admin
    self.save
  end

  def email_confirmation_sent_recently?
    !(registration_email_count < 5) && (email_confirmation_sent_at > 1.minute.ago)
  end

  def resend_email_confirmation!
    return if email_confirmation_sent_recently?
    RegistrationMailer.email_confirmation(self.id).deliver_now
  end
end
