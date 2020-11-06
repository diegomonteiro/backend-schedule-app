require 'test_helper'

class AgendamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agendamento = agendamentos(:one)
  end

  test "deve ter index" do
    get agendamentos_url
    assert_response :success
  end

  test "deve ter uma página de novo agendamento" do
    get new_agendamento_url
    assert_response :success
  end

  test "deve possibilitar a criação de um novo agendamento" do
    assert_difference('Agendamento.count') do
      post agendamentos_url, params: { agendamento: { data_hora: @agendamento.data_hora, tipo_curso_id: @agendamento.tipo_curso_id, usuario_id: @agendamento.usuario_id } }
    end

    assert_redirected_to agendamento_url(Agendamento.last)
  end

  test "deve exibir um agendamento" do
    get agendamento_url(@agendamento)
    assert_response :success
  end

  test "deve possibilitar a edição de um agendamento" do
    get edit_agendamento_url(@agendamento)
    assert_response :success
  end

  test "deve possibilitar a atualização de itens de um agendamento" do
    patch agendamento_url(@agendamento), params: { agendamento: { data_hora: @agendamento.data_hora, tipo_curso_id: @agendamento.tipo_curso_id, usuario_id: @agendamento.usuario_id } }
    assert_redirected_to agendamento_url(@agendamento)
  end

  test "deve possibilitar a exclusão de um agendamento" do
    assert_difference('Agendamento.count', -1) do
      delete agendamento_url(@agendamento)
    end

    assert_redirected_to agendamentos_url
  end
end
