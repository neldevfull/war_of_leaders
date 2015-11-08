class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.belongs_to :user, default: 0,
        index: true, foreign_key: true
      t.integer :number

      t.timestamps null: false
    end
  end
end
