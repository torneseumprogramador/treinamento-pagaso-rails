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

ActiveRecord::Schema.define(version: 2023_08_03_171541) do

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

  create_table "clientes", force: :cascade do |t|
    t.string "nome", limit: 150
    t.string "telefone", limit: 25
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "pedidos", force: :cascade do |t|
    t.bigint "cliente_id"
    t.float "valor_total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_pedidos_on_cliente_id"
  end

  create_table "pedidos_produtos", force: :cascade do |t|
    t.bigint "pedido_id"
    t.bigint "produto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pedido_id"], name: "index_pedidos_produtos_on_pedido_id"
    t.index ["produto_id"], name: "index_pedidos_produtos_on_produto_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome", limit: 100
    t.float "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "notas_alunos", "alunos"
  add_foreign_key "pedidos", "clientes"
  add_foreign_key "pedidos_produtos", "pedidos"
  add_foreign_key "pedidos_produtos", "produtos"
end
