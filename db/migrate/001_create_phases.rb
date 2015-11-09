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

    execute "INSERT INTO phases
              VALUES (1, 1, 'Placa Mãe', 'motherboard.png', now(), now()),
               (2, 1, 'Hard Disk', 'hd.png', now(), now()),
               (3, 1, 'Memória RAM', 'ram.png', now(), now()),
               (4, 1, 'CPU', 'cpu.png', now(), now()),
               (5, 1, 'Placa de Vídeo', 'videoboard.png', now(), now());"

  end
end
