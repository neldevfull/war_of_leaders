class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nikename, null: false
      t.string :email, null: false
      t.string :password_digest, null:false
      t.string :gender, null: true
      t.string :institution, null: true;
      t.string :course, null: true
      t.string :profile, null: false

      t.timestamps null: false
    end
  end
end
 