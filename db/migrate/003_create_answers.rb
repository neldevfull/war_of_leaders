class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers, id: false do |t|
      t.integer :answer_id, null: false
      t.belongs_to :question,
        index: true, foreign_key: true,
        null: false
      t.text :answer, null: false
      t.boolean :correct, null: false

      t.timestamps null: false
    end

    execute "ALTER TABLE answers ADD CONSTRAINT fk_answers
      PRIMARY KEY (answer_id, question_id); "

    execute " INSERT INTO answers 
              VALUES (1, 1, 'Processador', false, now(), now()),
               (2, 1, 'Memoria RAM', false, now(), now()),
               (3, 1, 'Disco rigido', false, now(), now()),
               (4, 1, 'Chipset', true, now(), now()),
               (1, 2, 'Serial', false, now(), now()),
               (2, 2, 'Mãe', true, now(), now()),
               (3, 2, 'USB', false, now(), now()),
               (4, 2, 'Video', false, now(), now()),
               (1, 3, 'Utilizou um Slot livre', false, now(), now()),
               (2, 3, 'Utilizou um Slot livre', true, now(), now()),
               (3, 3, 'Encaixou um USB na placa mãe', false, now(), now()),
               (4, 3, 'Encaixou dois USB na placa mãe', false, now(), now()),
               (1, 4, 'Software, software e hardware', false, now(), now()),
               (2, 4, 'Software hardware e hardware', false, now(), now()),
               (3, 4, 'Hardware, hardware e software', false, now(), now()),
               (4, 4, 'Software, hardware e software', true, now(), now()); "

  end
end
