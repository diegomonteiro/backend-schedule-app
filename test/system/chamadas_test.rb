require "application_system_test_case"

class ChamadasTest < ApplicationSystemTestCase
  setup do
    @chamada = chamadas(:one)
  end

  test "visiting the index" do
    visit chamadas_url
    assert_selector "h1", text: "Chamadas"
  end

  test "creating a Chamada" do
    visit chamadas_url
    click_on "New Chamada"

    fill_in "Agendamento", with: @chamada.agendamento_id
    check "Falta justificada" if @chamada.falta_justificada
    check "Presente" if @chamada.presente
    click_on "Create Chamada"

    assert_text "Chamada was successfully created"
    click_on "Back"
  end

  test "updating a Chamada" do
    visit chamadas_url
    click_on "Edit", match: :first

    fill_in "Agendamento", with: @chamada.agendamento_id
    check "Falta justificada" if @chamada.falta_justificada
    check "Presente" if @chamada.presente
    click_on "Update Chamada"

    assert_text "Chamada was successfully updated"
    click_on "Back"
  end

  test "destroying a Chamada" do
    visit chamadas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Chamada was successfully destroyed"
  end
end
