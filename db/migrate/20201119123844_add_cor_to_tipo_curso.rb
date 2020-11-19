class AddCorToTipoCurso < ActiveRecord::Migration[6.0]
  def change
    add_column :tipo_cursos, :cor, :string
  end
end
