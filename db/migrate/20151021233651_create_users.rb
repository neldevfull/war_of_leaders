class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fullname, null: false
      t.string :email, null: false
      t.string :institution, null: true;
      t.string :course, null:true
      t.string :f_type

      t.timestamps null: false
    end
  end
end
