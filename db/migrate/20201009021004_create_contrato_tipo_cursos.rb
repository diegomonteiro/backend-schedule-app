class CreateContratoTipoCursos < ActiveRecord::Migration[6.0]
  def change
    create_table :contrato_tipo_cursos do |t|
      t.belongs_to :contrato, null: false, foreign_key: true
      t.belongs_to :tipo_curso, null: false, foreign_key: true
      t.text :cursos

      t.timestamps
    end
  end
end
