class ChangeDataHoraType < ActiveRecord::Migration[6.0]
  def change
    change_column :agendamentos, :data_hora, :datetime
  end
end
