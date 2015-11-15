class CreateResults < ActiveRecord::Migration
  def change
    create_table :results, id: false do |t|
      t.string :key_master, null: false
      t.belongs_to :phase,
        index: true, foreign_key: true,
        null: false
      t.belongs_to :user,
        index: true, foreign_key: true,
        null: false
      t.integer :total_points, null: false
      t.string  :total_time, null: false
      	
      t.timestamps null: false
    end

    execute "ALTER TABLE results ADD CONSTRAINT pk_results
      PRIMARY KEY (key_master, phase_id, user_id); "
  end
end
