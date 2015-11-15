class CreatePhasestarts < ActiveRecord::Migration
  def change
    create_table :phasestarts, id: false do |t|
      t.string :key_master, null: false
      t.belongs_to :phase,
        index: true, foreign_key: true,
        null: false
      t.belongs_to :user,
        index: true, foreign_key: true,
        null: false
      t.datetime :day, null: false
      t.string :time, null: false

      t.timestamps null: false
    end

    execute "ALTER TABLE phasestarts ADD CONSTRAINT pk_startphases
      PRIMARY KEY (key_master, phase_id, user_id); "
  end
end
