class AddObservacaoToAgendamentos < ActiveRecord::Migration[6.0]
  def change
    add_column :agendamentos, :observacao, :text
  end
end
