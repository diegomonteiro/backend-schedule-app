class AddSalaToAgendamentos < ActiveRecord::Migration[6.0]
  def change
    add_reference :agendamentos, :sala, null: false, foreign_key: true
  end
end
