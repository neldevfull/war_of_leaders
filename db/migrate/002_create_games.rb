class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.belongs_to :user, default: 0,
        index: true, foreign_key: true
      t.string :title
      t.string :image
      t.string :slogan
      t.integer :status

      t.timestamps null: false
    end
    
    execute "INSERT INTO games 
              VALUES (1, NULL, 'Introdução a Computação', 'introduction_computing.png', 
                     'Coloque a prova seus conhecimentos sobre computação', 1, now(), now()),
                     (2, NULL, 'Estrutura de Dados', 'data_structure.png', 
                     'Desafie seus conhecimentos em um game sensacional', 1, now(), now()),
                     (3, NULL, 'Bando de Dados', 'database.png', 
                     'Competir nunca foi tão emocionante', 1, now(), now()),
                     (4, NULL, 'Lógica de Programação', 'programming_logic.png', 
                     'Crie algoritmos em uma batalha para gigantes', 1, now(), now()),
                     (5, NULL, 'Rede de Computadores', 'computer_network.png', 
                     'Se connect ao game que vai te surpreender', 1, now(), now()),
                     (6, NULL, 'Engenharia de Software', 'software_engineering.png', 
                     'Coloque a prova seus conhecimentos sobre software', 1, now(), now());"
  end
end
