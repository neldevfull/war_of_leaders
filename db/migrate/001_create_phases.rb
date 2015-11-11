class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.belongs_to :game,
        index: true, foreign_key: true,
        null: false	
      t.string :name, null: false
      t.string :description, null: false
      t.integer :time, null: false

      t.timestamps null: false
    end

    execute "INSERT INTO phases
              VALUES (1, 1, 'Placa Mãe',
                'Nessa fase os jogadores terão que responder perguntas objetivas 
                sobre esse componente responsável por fazer dos computadores máquinas incríveis, 
                serão 5 perguntas diferentes por jogadores, que deverão responder em até 40 minutos', 
                40, now(), now()),
               (2, 1, 'Hard Disk',
                'Nessa fase os jogadores terão que responder perguntas objetivas 
                sobre esse componente responsável por fazer dos computadores máquinas incríveis, 
                serão 5 perguntas diferentes por jogadores, que deverão responder em até 40 minutos', 
                40, now(), now()),
               (3, 1, 'Memória RAM', 
                'Nessa fase os jogadores terão que responder perguntas objetivas 
                sobre esse componente responsável por fazer dos computadores máquinas incríveis, 
                serão 5 perguntas diferentes por jogadores, que deverão responder em até 40 minutos', 
                40, now(), now()),
               (4, 1, 'CPU', 
                'Nessa fase os jogadores terão que responder perguntas objetivas 
                sobre esse componente responsável por fazer dos computadores máquinas incríveis, 
                serão 5 perguntas diferentes por jogadores, que deverão responder em até 40 minutos', 
                40, now(), now()),
               (5, 1, 'Placa de Vídeo', 
                'Nessa fase os jogadores terão que responder perguntas objetivas 
                sobre esse componente responsável por fazer dos computadores máquinas incríveis, 
                serão 5 perguntas diferentes por jogadores, que deverão responder em até 40 minutos', 
                40, now(), now());"

  end
end
