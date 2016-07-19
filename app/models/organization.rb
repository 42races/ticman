class Organization < ActiveRecord::Base

  has_many :users

  validates :name, presence: true

  # begin ClassMethods
  def self.provision!(reg)
    org = Organization.new do |f|
      f.name = reg.organization_name
    end

    create_admin_for_organization(reg, org) if org.save
  end

  def self.create_admin_for_organization(reg, org)
    admin = User.build_new_user({
      email: reg.email,
      role: 'admin'
    })

    admin.organization = org

    if admin.save
      reg.mark_as_registered!(org, admin)
      admin.confirm_email!
    end

    admin
  end
  # end ClassMethods

end
