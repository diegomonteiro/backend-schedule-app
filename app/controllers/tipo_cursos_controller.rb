class TipoCursosController < ApplicationController
  before_action :set_tipo_curso, only: [:show, :edit, :update, :destroy]

  # GET /tipo_cursos
  # GET /tipo_cursos.json
  def index
    @tipo_cursos = TipoCurso.all
  end

  # GET /tipo_cursos/1
  # GET /tipo_cursos/1.json
  def show
  end

  # GET /tipo_cursos/new
  def new
    @tipo_curso = TipoCurso.new
  end

  # GET /tipo_cursos/1/edit
  def edit
  end

  # POST /tipo_cursos
  # POST /tipo_cursos.json
  def create
    @tipo_curso = TipoCurso.new(tipo_curso_params)

    respond_to do |format|
      if @tipo_curso.save
        format.html { redirect_to @tipo_curso, notice: 'Tipo do curso foi criado.' }
        format.json { render :show, status: :created, location: @tipo_curso }
      else
        format.html { render :new }
        format.json { render json: @tipo_curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_cursos/1
  # PATCH/PUT /tipo_cursos/1.json
  def update
    respond_to do |format|
      if @tipo_curso.update(tipo_curso_params)
        format.html { redirect_to @tipo_curso, notice: 'Tipo do curso foi atualizado.' }
        format.json { render :show, status: :ok, location: @tipo_curso }
      else
        format.html { render :edit }
        format.json { render json: @tipo_curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_cursos/1
  # DELETE /tipo_cursos/1.json
  def destroy
    @tipo_curso.destroy
    respond_to do |format|
      format.html { redirect_to tipo_cursos_url, notice: 'Tipo do curso foi excluído.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_curso
      @tipo_curso = TipoCurso.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_curso_params
      params.require(:tipo_curso).permit(:nome)
    end
end
