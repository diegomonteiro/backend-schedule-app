require "application_system_test_case"

class AgendamentosTest < ApplicationSystemTestCase
  setup do
    @agendamento = agendamentos(:one)
  end

  test "visiting the index" do
    visit agendamentos_url
    assert_selector "h1", text: "Agendamentos"
  end

  test "creating a Agendamento" do
    visit agendamentos_url
    click_on "New Agendamento"

    fill_in "Data hora", with: @agendamento.data_hora
    fill_in "Tipo curso", with: @agendamento.tipo_curso_id
    fill_in "Usuario", with: @agendamento.usuario_id
    click_on "Create Agendamento"

    assert_text "Agendamento was successfully created"
    click_on "Back"
  end

  test "updating a Agendamento" do
    visit agendamentos_url
    click_on "Edit", match: :first

    fill_in "Data hora", with: @agendamento.data_hora
    fill_in "Tipo curso", with: @agendamento.tipo_curso_id
    fill_in "Usuario", with: @agendamento.usuario_id
    click_on "Update Agendamento"

    assert_text "Agendamento was successfully updated"
    click_on "Back"
  end

  test "destroying a Agendamento" do
    visit agendamentos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Agendamento was successfully destroyed"
  end
end
