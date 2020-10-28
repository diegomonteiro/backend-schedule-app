class CreateChamadas < ActiveRecord::Migration[6.0]
  def change
    create_table :chamadas do |t|
      t.belongs_to :agendamento, null: false, foreign_key: true
      t.boolean :presente
      t.boolean :falta_justificada

      t.timestamps
    end
  end
end
