class CreatePhasestarts < ActiveRecord::Migration
  def change
    create_table :phasestarts do |t|
      t.belongs_to :phase,
        index: true, foreign_key: true,
        null: false
      t.belongs_to :user,
        index: true, foreign_key: true,
        null: false
      t.datetime :date_ini
      t.datetime :date_end

      t.timestamps null: false
    end
  end
end
