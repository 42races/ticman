class AddReferencesToRegistrations < ActiveRecord::Migration
  def change
    add_reference :registrations, :user, index: true
    add_foreign_key :registrations, :users
    add_reference :registrations, :organization, index: true
    add_foreign_key :registrations, :organizations
  end
end
