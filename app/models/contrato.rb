class Contrato < ApplicationRecord
  belongs_to :usuario
  belongs_to :tipo_curso

  scope :do_usuario, -> (usuario_id) { where("usuario_id = ?", usuario_id) unless usuario_id.blank? }
  scope :com_validade, -> (data_ini, data_fim) { where("data_ini >= ? AND data_fim <= ?", data_ini, data_fim) unless (data_ini.nil? || data_fim.nil?) && (data_ini > data_fim) }
  scope :do_tipo_curso, -> (tipo_curso_id) { where("tipo_curso_id = ?", tipo_curso_id) unless tipo_curso_id.nil? }
  scope :regular, -> (regular) { where("regular = true") }

  validates :numero_matricula, uniqueness: { scope: :numero_matricula, message: "matrícula já existe" }
end
