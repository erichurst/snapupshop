class CreateUsers < ActiveRecord::Migration
  def change
    say "########## CREATING USERS TABLE ##########"
    create_table :users do |t|
      t.string :instagram_username
      t.string :email
      t.text   :api_token
      t.string :access_token
      t.string :instagram_id
      t.string :instagram_full_name
      t.string :instagram_profile_picture

      t.timestamps
    end
    say "########## ADDING USERS INDEXES ##########"
    add_index :users, :api_token
    add_index :users, :instagram_id
    add_index :users, :access_token
    add_index :users, :instagram_username
    add_index :users, :instagram_full_name
    add_index :users, :email
  end
end
