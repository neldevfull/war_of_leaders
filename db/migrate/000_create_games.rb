class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :image
      t.string :slogan
      t.integer :status

      t.timestamps null: false
    end
    
    execute "INSERT INTO games 
              VALUES (1, 'Introdução a Computação', 'introduction_computing.png', 
                     'Coloque a prova seus conhecimentos sobre computação', 1, now(), now()),
                     (2, 'Estrutura de Dados', 'data_structure.png', 
                     'Desafie seus conhecimentos em um game sensacional', 1, now(), now()),
                     (3, 'Bando de Dados', 'database.png', 
                     'Competir nunca foi tão emocionante', 1, now(), now()),
                     (4, 'Lógica de Programação', 'programming_logic.png', 
                     'Crie algoritmos em uma batalha para gigantes', 1, now(), now()),
                     (5, 'Rede de Computadores', 'computer_network.png', 
                     'Se connect ao game que vai te surpreender', 1, now(), now()),
                     (6, 'Engenharia de Software', 'software_engineering.png', 
                     'Coloque a prova seus conhecimentos sobre software', 1, now(), now());"
  end
end
