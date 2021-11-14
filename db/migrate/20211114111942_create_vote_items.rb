class CreateVoteItems < ActiveRecord::Migration[5.2]
  def change
    create_table :vote_items do |t|
      t.references :vote, foreign_key: true
      t.string :item, null: false
      t.timestamps
    end
  end
end
