class AddEmailConfirmationFields < ActiveRecord::Migration
  def change
    add_column :users, :email_confirmation_token, :string
    add_column :users, :email_confirmed_at, :datetime
    add_column :users, :email_confirmation_sent_at, :datetime
    add_index  :users, :email_confirmation_token, unique: true
  end
end
