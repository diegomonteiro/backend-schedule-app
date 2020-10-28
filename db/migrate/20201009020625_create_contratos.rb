class CreateContratos < ActiveRecord::Migration[6.0]
  def change
    create_table :contratos do |t|
      t.belongs_to :usuario, null: false, foreign_key: true
      t.date :data_ini
      t.date :data_fim
      t.integer :carga_horario_semanal
      t.string :numero_matricula
      t.boolean :regular

      t.timestamps
    end
  end
end
