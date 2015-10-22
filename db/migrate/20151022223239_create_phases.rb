class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.string :description, null: false
      t.integer :pointers, null: false
      t.string :status, null: false, default: "ativo"

      t.timestamps null: false
    end
  end
end
