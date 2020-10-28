class ContratoTipoCurso < ApplicationRecord
  belongs_to :contrato
  belongs_to :tipo_curso
end
