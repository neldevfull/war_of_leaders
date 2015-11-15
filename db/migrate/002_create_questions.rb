class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :game,
      	index: true, foreign_key: true,
      	null: false
      t.belongs_to :phase,
      	index: true, foreign_key: true,
      	null: false	
      t.text :question, null: false
      t.integer :points, null: false

      t.timestamps null: false
    end

    execute "INSERT INTO questions
              VALUES (1, 1, 1, 'Na placa-mãe alguns componentes já vêm instalados e outros serão conectados na sua 
                      placa de circuito. Um exemplo típico de componente que já vem, 
                      nativamente, instalado na placa-mãe é:', 100, now(), now()),
                      (2, 1, 1, 'A placa de circuito de um micro onde ficam localizados 
                      o processador e a memória RAM, principalmente, é a placa:', 100, now(), now()),
                      (3, 1, 1, 'Um supervisor solicitou a um funcionário que procedesse à adaptação de uma 
                      placa de rede e uma de som na placa-mãe de seu microcomputador. 
                      Considerando que na placa-mãe existem encaixes próprios para tal, o funcionário', 100, now(), now()),
                      (4, 1, 1, 'O BIOS, o CMOS e o SETUP de um microcomputador correspondem, 
                      respectivamente, a componentes de', 100, now(), now()); "

  end
end
