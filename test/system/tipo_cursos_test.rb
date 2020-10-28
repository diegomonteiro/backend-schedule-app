require "application_system_test_case"

class TipoCursosTest < ApplicationSystemTestCase
  setup do
    @tipo_curso = tipo_cursos(:one)
  end

  test "visiting the index" do
    visit tipo_cursos_url
    assert_selector "h1", text: "Tipo Cursos"
  end

  test "creating a Tipo curso" do
    visit tipo_cursos_url
    click_on "New Tipo Curso"

    fill_in "Nome", with: @tipo_curso.nome
    click_on "Create Tipo curso"

    assert_text "Tipo curso was successfully created"
    click_on "Back"
  end

  test "updating a Tipo curso" do
    visit tipo_cursos_url
    click_on "Edit", match: :first

    fill_in "Nome", with: @tipo_curso.nome
    click_on "Update Tipo curso"

    assert_text "Tipo curso was successfully updated"
    click_on "Back"
  end

  test "destroying a Tipo curso" do
    visit tipo_cursos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tipo curso was successfully destroyed"
  end
end
