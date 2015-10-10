class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  Role::ROLES.each do |role|
    define_method "#{role}?".to_sym do
      # cache the role name
      self.role == role
    end
  end

  validates :role, presence: true
end
