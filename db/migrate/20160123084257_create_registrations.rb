class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :organization_name
      t.string :email

      t.timestamps null: false
    end
    add_index :registrations, :email, unique: true
  end
end
