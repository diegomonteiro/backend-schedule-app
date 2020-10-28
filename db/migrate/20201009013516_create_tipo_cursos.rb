class CreateTipoCursos < ActiveRecord::Migration[6.0]
  def change
    create_table :tipo_cursos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
