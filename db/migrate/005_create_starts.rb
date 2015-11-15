class CreateStarts < ActiveRecord::Migration
  def change
    create_table :starts, id: false do |t|
      t.string :key_master, null: false	
      t.belongs_to :user,
        index: true, foreign_key: true,
        null: false
      t.belongs_to :game, foreign_key: true,
        null: false
      t.integer :number_team, null: false
      t.timestamps null: false
    end

    execute "ALTER TABLE starts ADD CONSTRAINT pk_starts
      PRIMARY KEY (key_master, user_id)"
  end
end
