class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :instagram_username
      t.string :email
      t.text   :api_token
      t.string :access_token

      t.timestamps
    end
  end
end
