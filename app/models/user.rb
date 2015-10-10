class User < ActiveRecord::Base

  validates :role, presence: true

  Role::ROLES.each do |role|
    define_method "#{role}?".to_sym do
      self.role == role
    end
  end

end
