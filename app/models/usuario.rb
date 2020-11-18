class Usuario < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :registerable
  devise :database_authenticatable,
         :confirmable, :trackable, :recoverable, :rememberable, :validatable

  has_many :agendamentos
  has_many :chamadas
  has_many :contratos

  after_create :atribuir_perfil_padrao

  def atribuir_perfil_padrao
    self.add_role(:aluno) if self.roles.blank?
  end

  def agendamentos_por_semana
    Agendamento.do_usuario(id)
    .select(
      "usuario_id,
       tipo_curso_id,
       date_part('week', data_hora) as semana,
       json_agg(agendamentos.*) as agendamentos
    ").joins(:usuario, :tipo_curso)
    .group(:usuario_id, :tipo_curso_id, "semana")
  end
end
