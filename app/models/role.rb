class Role < ActiveRecord::Base

  ROLES = %w(admin analyst staff)

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, inclusion: {
    in: ROLES,
    message: 'Invalid role'
  }
end
