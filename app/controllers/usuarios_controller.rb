class UsuariosController < ApplicationController
  def alunos
    @alunos = Usuario.with_any_role(:aluno)
    render "usuarios/alunos/index"
  end

  def responsaveis
    @responsaveis = Usuario.with_any_role(:responsavel)
    render "usuarios/responsaveis/index"
  end

  def admins
  end

end
