class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays, id: false do |t|
      t.string :key_master, null: false
      t.belongs_to :user,
        index: true, foreign_key: true,
        null: false
      t.belongs_to :phase,
        index: true, foreign_key: true,
        null: false
      t.belongs_to :question,
        index: true, foreign_key: true,
        null: false
      t.integer :answer_id, null: false
      t.boolean :correct, null: false

      t.timestamps null: false
    end

    execute "ALTER TABLE plays ADD CONSTRAINT pk_plays
      PRIMARY KEY 
      (key_master, user_id, phase_id, question_id, answer_id); "
      
  end  
end
