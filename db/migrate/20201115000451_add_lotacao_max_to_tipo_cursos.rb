class AddLotacaoMaxToTipoCursos < ActiveRecord::Migration[6.0]
  def change
    add_column :tipo_cursos, :lotacao_max, :integer
  end
end
