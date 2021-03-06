class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams, id: false do |t|            
      t.string :key_master, null: false
      t.belongs_to :user,
        index: true, foreign_key: true,
        null: false
      t.string :name 
      t.string :bgcolor
      t.string :menucolor
      t.string :hovercolor     
      
      t.timestamps null: false
    end

    execute "ALTER TABLE teams ADD CONSTRAINT pk_teams
      PRIMARY KEY (key_master, user_id)"
  end
end
