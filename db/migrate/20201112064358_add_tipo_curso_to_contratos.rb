class AddTipoCursoToContratos < ActiveRecord::Migration[6.0]
  def change
    add_reference :contratos, :tipo_curso, null: false, foreign_key: true
  end
end
