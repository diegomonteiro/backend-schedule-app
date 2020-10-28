class CreateAgendamentos < ActiveRecord::Migration[6.0]
  def change
    create_table :agendamentos do |t|
      t.belongs_to :usuario, null: false, foreign_key: true
      t.datetime :data_hora
      t.belongs_to :tipo_curso, null: false, foreign_key: true

      t.timestamps
    end
  end
end
