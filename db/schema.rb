# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_07_27_185355) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alunos", force: :cascade do |t|
    t.string "nome", limit: 150
    t.string "email", limit: 100
    t.text "obs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sobrenome", limit: 100
    t.integer "idade", default: 18
  end

  create_table "contatos", force: :cascade do |t|
    t.string "nome", limit: 150
    t.string "email", limit: 200
    t.text "observacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notas_alunos", force: :cascade do |t|
    t.bigint "aluno_id"
    t.float "nota"
    t.text "obs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id"], name: "index_notas_alunos_on_aluno_id"
  end

  add_foreign_key "notas_alunos", "alunos"
end
