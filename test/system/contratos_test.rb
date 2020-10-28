require "application_system_test_case"

class ContratosTest < ApplicationSystemTestCase
  setup do
    @contrato = contratos(:one)
  end

  test "visiting the index" do
    visit contratos_url
    assert_selector "h1", text: "Contratos"
  end

  test "creating a Contrato" do
    visit contratos_url
    click_on "New Contrato"

    fill_in "Carga horario semanal", with: @contrato.carga_horario_semanal
    fill_in "Data fim", with: @contrato.data_fim
    fill_in "Data ini", with: @contrato.data_ini
    fill_in "Numero matricula", with: @contrato.numero_matricula
    check "Regular" if @contrato.regular
    fill_in "Usuario", with: @contrato.usuario_id
    click_on "Create Contrato"

    assert_text "Contrato was successfully created"
    click_on "Back"
  end

  test "updating a Contrato" do
    visit contratos_url
    click_on "Edit", match: :first

    fill_in "Carga horario semanal", with: @contrato.carga_horario_semanal
    fill_in "Data fim", with: @contrato.data_fim
    fill_in "Data ini", with: @contrato.data_ini
    fill_in "Numero matricula", with: @contrato.numero_matricula
    check "Regular" if @contrato.regular
    fill_in "Usuario", with: @contrato.usuario_id
    click_on "Update Contrato"

    assert_text "Contrato was successfully updated"
    click_on "Back"
  end

  test "destroying a Contrato" do
    visit contratos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contrato was successfully destroyed"
  end
end
