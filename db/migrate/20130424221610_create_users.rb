class CreateUsers < ActiveRecord::Migration
  def change
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
  end
end
