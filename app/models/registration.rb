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

  def reset_confirmation_token!
    self.email_confirmation_token = Service.reference_code(email)
    self.save(validates: false)
  end
end
