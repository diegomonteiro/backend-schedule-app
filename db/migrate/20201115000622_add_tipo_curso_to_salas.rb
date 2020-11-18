class AddTipoCursoToSalas < ActiveRecord::Migration[6.0]
  def change
    add_reference :salas, :tipo_curso, null: false, foreign_key: true
  end
end
