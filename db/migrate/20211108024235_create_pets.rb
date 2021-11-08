class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.integer :user_id
      t.integer :sex
      t.string :profile_image
      t.integer :age
      t.string :type
      t.string :name

      t.timestamps
    end
  end
end
