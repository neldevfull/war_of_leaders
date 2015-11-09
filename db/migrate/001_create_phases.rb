class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.belongs_to :game,
        index: true, foreign_key: true,
        null: false	
      t.string :name
      t.string :logotype

      t.timestamps null: false
    end
  end
end
