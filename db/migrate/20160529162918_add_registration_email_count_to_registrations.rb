class AddRegistrationEmailCountToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :registration_email_count, :integer, default: 0
  end
end
