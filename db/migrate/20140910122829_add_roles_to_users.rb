class AddRolesToUsers < ActiveRecord::Migration
  def change
  	drop_table :users
    create_table :users do |t|
      t.string :username
      t.string :password_hash
      t.string :password_salt
      t.string :roles, default: "--- []"

      t.timestamps
  	end
  end
end
