class User < ActiveRecord::Base
  has_secure_password

  has_one    :registration
  belongs_to :organization

  validates :email, presence: true
  validates :role, presence: true
  validates :role, inclusion: {
    in: Role::ROLES
  }

  validates :password, length: { minimum: 6, maximum: 30 }, allow_nil: true

  Role::ROLES.each do |role|
    define_method "#{role}?".to_sym do
      self.role == role
    end
  end

  # class methods

    def self.build_new_user(user_params)
      User.new do |u|
        u.email = user_params[:email].downcase
        u.name  = user_params[:name]
        u.role  = user_params[:role]
        u.password                  = Service.random_key
        u.password_confirmation     = u.password
        u.email_confirmation_token  = Service.reference_code(u.email)
      end
    end
  # end of class methods

  def confirm_email!
    self.touch(:email_confirmed_at) if !email_confirmed?
  end

  def email_confirmed?
    self.email_confirmed_at.present?
  end
end
