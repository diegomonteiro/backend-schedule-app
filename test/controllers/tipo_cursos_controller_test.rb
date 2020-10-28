require 'test_helper'

class TipoCursosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_curso = tipo_cursos(:one)
  end

  test "should get index" do
    get tipo_cursos_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_curso_url
    assert_response :success
  end

  test "should create tipo_curso" do
    assert_difference('TipoCurso.count') do
      post tipo_cursos_url, params: { tipo_curso: { nome: @tipo_curso.nome } }
    end

    assert_redirected_to tipo_curso_url(TipoCurso.last)
  end

  test "should show tipo_curso" do
    get tipo_curso_url(@tipo_curso)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_curso_url(@tipo_curso)
    assert_response :success
  end

  test "should update tipo_curso" do
    patch tipo_curso_url(@tipo_curso), params: { tipo_curso: { nome: @tipo_curso.nome } }
    assert_redirected_to tipo_curso_url(@tipo_curso)
  end

  test "should destroy tipo_curso" do
    assert_difference('TipoCurso.count', -1) do
      delete tipo_curso_url(@tipo_curso)
    end

    assert_redirected_to tipo_cursos_url
  end
end
