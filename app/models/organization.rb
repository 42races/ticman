class Organization < ActiveRecord::Base

  has_many :users

  validates :name, presence: true

  def self.provision!(user)
    org = Organization.new do |f|
      f.name = user.name
    end

    # add user as admin of the organization
    if org.save
      user.organization = org
      user.save
    end
  end
end
