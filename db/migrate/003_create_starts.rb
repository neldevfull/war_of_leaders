class CreateStarts < ActiveRecord::Migration
  def change
    create_table :starts do |t|
      t.belongs_to :user,
        index: true, foreign_key: true,
        null: false
      t.belongs_to :game,
        index: true, foreign_key: true,
        null: false
      t.integer :number_team, null: false
      t.string :key_master, null: false	
      t.timestamps null: false
    end
  end
end
