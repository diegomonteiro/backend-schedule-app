class CreateSalas < ActiveRecord::Migration[6.0]
  def change
    create_table :salas do |t|
      t.string :nome
      t.integer :lotacao_max

      t.timestamps
    end
  end
end
