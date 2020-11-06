# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_31_212014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agendamentos", force: :cascade do |t|
    t.bigint "usuario_id", null: false
    t.datetime "data_hora"
    t.bigint "tipo_curso_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "observacao"
    t.time "hora_duracao"
    t.index ["tipo_curso_id"], name: "index_agendamentos_on_tipo_curso_id"
    t.index ["usuario_id"], name: "index_agendamentos_on_usuario_id"
  end

  create_table "chamadas", force: :cascade do |t|
    t.bigint "agendamento_id", null: false
    t.boolean "presente"
    t.boolean "falta_justificada"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["agendamento_id"], name: "index_chamadas_on_agendamento_id"
  end

  create_table "contrato_tipo_cursos", force: :cascade do |t|
    t.bigint "contrato_id", null: false
    t.bigint "tipo_curso_id", null: false
    t.text "cursos"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contrato_id"], name: "index_contrato_tipo_cursos_on_contrato_id"
    t.index ["tipo_curso_id"], name: "index_contrato_tipo_cursos_on_tipo_curso_id"
  end

  create_table "contratos", force: :cascade do |t|
    t.bigint "usuario_id", null: false
    t.date "data_ini"
    t.date "data_fim"
    t.integer "carga_horario_semanal"
    t.string "numero_matricula"
    t.boolean "regular"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["usuario_id"], name: "index_contratos_on_usuario_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "salas", force: :cascade do |t|
    t.string "nome"
    t.integer "lotacao_max"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tipo_cursos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nome"
    t.string "cpf"
    t.string "rg"
    t.date "data_nasc"
    t.text "endereco"
    t.string "telefone"
    t.integer "grau_instrucao"
    t.integer "responsavel_id"
    t.index ["confirmation_token"], name: "index_usuarios_on_confirmation_token", unique: true
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  create_table "usuarios_roles", id: false, force: :cascade do |t|
    t.bigint "usuario_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_usuarios_roles_on_role_id"
    t.index ["usuario_id", "role_id"], name: "index_usuarios_roles_on_usuario_id_and_role_id"
    t.index ["usuario_id"], name: "index_usuarios_roles_on_usuario_id"
  end

  add_foreign_key "agendamentos", "tipo_cursos"
  add_foreign_key "agendamentos", "usuarios"
  add_foreign_key "chamadas", "agendamentos"
  add_foreign_key "contrato_tipo_cursos", "contratos"
  add_foreign_key "contrato_tipo_cursos", "tipo_cursos"
  add_foreign_key "contratos", "usuarios"
end
