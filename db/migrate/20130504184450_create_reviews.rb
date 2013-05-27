class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :instagram_image_id
      t.references :user
      t.string :body
      t.string :author
      t.string :token

      t.timestamps
    end
    add_index :reviews, :instagram_image_id
    add_index :reviews, :token
  end
end
