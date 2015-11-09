class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|      
      t.belongs_to :start,
        index: true, foreign_key: true,
        null: false
      t.belongs_to :user,
        index: true, foreign_key: true,
        null: false
      t.string :name      
      
      t.timestamps null: false
    end
  end
end
