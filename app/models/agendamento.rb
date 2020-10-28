class Agendamento < ApplicationRecord
  belongs_to :usuario
  belongs_to :tipo_curso
end
