class AddEmailAndPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :password_digest, :string
  end

  add_index :users, :email, unique: true
end
