class AddEmailConfirmationTokenAndConfirmedAtToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :email_confirmation_token, :string
    add_index :registrations, :email_confirmation_token, unique: true
    add_column :registrations, :confirmed_at, :datetime
  end
end
