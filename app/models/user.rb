class User < ActiveRecord::Base

  attr_accessor :password, :password_confirmation

  validates :role, presence: true
  validates :role, inclusion: {
    in: Role::ROLES
  }

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

end
