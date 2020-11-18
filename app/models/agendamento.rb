class Agendamento < ApplicationRecord
  belongs_to :usuario
  belongs_to :tipo_curso
  belongs_to :sala

  scope :do_usuario, -> (usuario_id) { where("usuario_id = ?", usuario_id) unless usuario_id.blank? }
  scope :na_data, -> (data) { where("data_hora::date = ?", data) }
  scope :do_tipo_curso, -> (tipo_curso_id) { where("tipo_curso_id = ?", tipo_curso_id) unless tipo_curso_id.blank? }
  scope :na_sala, -> (sala) { where("sala_id = ?", sala) unless sala.blank? }
  scope :na_semana, -> (semana) { where("date_part('week', data_hora) = ?", semana) unless semana.blank? }
  #scope :a_partir_da_data, -> (data_hora) { where("data_hora >= ?", data_hora) unless data_hora.blank? }

  validates :usuario_id, presence: true
  validates :data_hora, presence: true
  validates :hora_duracao, presence: true
  validates :tipo_curso_id, presence: true

  validate :limite_de_alunos_por_tipo_de_curso, :limite_carga_horaria_semanal, :conflito_de_agendamentos, :agendamento_no_passado, :verificar_contrato_valido

  def verificar_contrato_valido
    usuario = Usuario.where("id = ?", usuario_id)

    unless usuario.nil?
      contratos = Contrato.do_usuario(usuario_id)

      if contratos.size > 0

        contratos.each do |contrato|
          if !contrato.regular
            errors.add(:contrato_irregular, " #{contrato.id}, verifique novamente.")
          end

          if contrato.data_fim < Time.zone.now
            errors.add(:contrato_expirado, " #{contrato.id}, verifique novamente.")
          end
        end
      else
        errors.add(:contrato_nao_encontrados, " verifique novamente.")
      end

    else
      errors.add(:usuario_nao_encontrado, " verifique novamente.")
    end
  end

  def agendamento_no_passado
    if data_hora < 1.day.ago
      errors.add(:agendamento_no_passado, " verifique a data e tente novamente.")
    end
  end

  def conflito_de_agendamentos

    agendamentos = Agendamento.do_usuario(usuario_id).na_data(data_hora)

    agendamentos.each do |agendamento|
      duracao  = agendamento.hora_duracao.localtime.strftime("%H:%M").split(":")

      data_ini = agendamento.data_hora
      data_fim = agendamento.data_hora + ((duracao[0].to_i * 60) + (duracao[1].to_f)).minutes

      r_data_ini = data_hora
      r_data_fim = data_hora + ((duracao[0].to_i * 60) + (duracao[1].to_f)).minutes

      if (r_data_ini..r_data_fim).overlaps?(data_ini..data_fim)
        errors.add(:conflito_de_agendamentos, " com o agendamento #{agendamento.id} => #{data_ini.strftime("%d/%m/%Y %H:%M")} até #{data_fim.strftime("%d/%m/%Y %H:%M")}")
      end

      if r_data_fim < r_data_ini
        errors.add(:data_de_inicio_no_futuro, " corrija e tente novamente.")
      end

      if r_data_ini == r_data_fim
        errors.add(:data_de_inicio_igual_a_data_fim, ", corrija e tente novamente.")
      end

    end
  end

  def limite_carga_horaria_semanal
    agendamentos = Agendamento.do_usuario(usuario_id).do_tipo_curso(tipo_curso_id).na_semana(data_hora.strftime("%U").to_i)
    duracao = agendamentos.sum(:hora_duracao).split(":")

    hora_duracao    = duracao[0].to_i + (duracao[1].to_f/60)

    contratos = Contrato.do_usuario(usuario_id).do_tipo_curso(tipo_curso_id)
    puts "Hora Duração: #{hora_duracao}"

    unless contratos.blank?
      puts "Contratos: #{contratos}"
      limite_carga_horaria_semanal = contratos.first.carga_horario_semanal
      if hora_duracao >= limite_carga_horaria_semanal
        errors.add(:limite_carga_horaria_semanal, "atingida, verifica e tente novamente.")
      end
    else
      errors.add(:aluno_sem_contrato_pro_curso, " verifique novamente.")
    end
  end

  #valida se a quantidade de alunos na sala está sendo respeitada
  def limite_de_alunos_por_tipo_de_curso
    agendamentos = Agendamento.na_data(data_hora).do_tipo_curso(tipo_curso_id).na_sala(sala_id)

    limite_alunos_sala = Sala.where("id = ?", sala_id).first

    if agendamentos.size >= limite_alunos_sala.lotacao_max
      errors.add(:lotacao_maxima_da_sala, "atingida, verifique e tente novamente.")
    end
  end

  def calcular_data_fim
    time_split = hora_duracao.strftime("%H:%M").split(":")
    hours   = time_split[0].to_i
    minutes = time_split[1].to_i

    dft = (hours*60) + (minutes)
    return data_hora + dft.minutes
  end

  def tem_contrato_valido?
    data_fim = calcular_data_fim
    contratos_ativos = Contrato.do_usuario(usuario_id).com_validade(data_hora, data_fim).do_tipo_curso(tipo_curso_id)
    return !(contratos_ativos.blank?) ? true : false
  end
end
