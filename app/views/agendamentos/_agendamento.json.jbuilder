json.extract! agendamento, :id, :usuario_id, :data_hora, :hora_duracao, :tipo_curso_id, :created_at, :updated_at
json.url agendamento_url(agendamento, format: :json)
