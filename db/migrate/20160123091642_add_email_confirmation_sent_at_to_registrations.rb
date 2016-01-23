class AddEmailConfirmationSentAtToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :email_confirmation_sent_at, :datetime
  end
end
