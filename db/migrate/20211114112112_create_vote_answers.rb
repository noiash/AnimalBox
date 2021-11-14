class CreateVoteAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :vote_answers do |t|
      t.references :user, foreign_key: true
      t.references :vote_item, foreign_key: true
      t.timestamps
    end
  end
end
