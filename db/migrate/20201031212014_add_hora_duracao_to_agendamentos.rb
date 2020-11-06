class AddHoraDuracaoToAgendamentos < ActiveRecord::Migration[6.0]
  def change
    add_column :agendamentos, :hora_duracao, :time
  end
end
