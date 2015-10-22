class CreateMatters < ActiveRecord::Migration
  def change
    create_table :matters do |t|
      t.string :urlfile, null: false

      t.timestamps null: false
    end
  end
end
