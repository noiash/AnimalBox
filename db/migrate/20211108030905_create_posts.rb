class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :pet_id
      t.string :title
      t.text :introduction
      t.string :image_id
      t.string :video_id

      t.timestamps
    end
  end
end
