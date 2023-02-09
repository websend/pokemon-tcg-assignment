# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_08_160230) do
  create_table "abilities", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "effect"
    t.string "ability_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ability_type"], name: "index_abilities_on_ability_type"
    t.index ["name"], name: "index_abilities_on_name"
  end

  create_table "abilities_cards", id: false, charset: "utf8mb4", force: :cascade do |t|
    t.bigint "ability_id", null: false
    t.bigint "card_id", null: false
    t.index ["ability_id", "card_id"], name: "index_abilities_cards_on_ability_id_and_card_id"
    t.index ["card_id", "ability_id"], name: "index_abilities_cards_on_card_id_and_ability_id"
  end

  create_table "attacks", charset: "utf8mb4", force: :cascade do |t|
    t.string "cost"
    t.string "damage"
    t.text "effect"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attacks_cards", id: false, charset: "utf8mb4", force: :cascade do |t|
    t.bigint "attack_id", null: false
    t.bigint "card_id", null: false
    t.index ["attack_id", "card_id"], name: "index_attacks_cards_on_attack_id_and_card_id"
    t.index ["card_id", "attack_id"], name: "index_attacks_cards_on_card_id_and_attack_id"
  end

  create_table "card_series", charset: "utf8mb4", force: :cascade do |t|
    t.string "unique_id"
    t.string "name"
    t.string "logo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_card_series_on_name"
  end

  create_table "card_sets", charset: "utf8mb4", force: :cascade do |t|
    t.string "unique_id"
    t.bigint "card_serie_id", null: false
    t.string "name"
    t.string "logo_url"
    t.string "symbol_url"
    t.date "release_date"
    t.integer "first_edition_cards"
    t.integer "holo_cards"
    t.integer "normal_cards"
    t.integer "official_cards"
    t.integer "reverse_cards"
    t.integer "total_cards"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_serie_id"], name: "index_card_sets_on_card_serie_id"
    t.index ["name"], name: "index_card_sets_on_name"
    t.index ["release_date"], name: "index_card_sets_on_release_date"
  end

  create_table "cards", charset: "utf8mb4", force: :cascade do |t|
    t.string "unique_id"
    t.bigint "card_set_id", null: false
    t.string "category"
    t.string "description"
    t.integer "dex_id"
    t.text "effect"
    t.string "energy_type"
    t.string "evolve_from"
    t.float "hp"
    t.string "illustrator"
    t.string "image_url"
    t.integer "level"
    t.string "local_id"
    t.string "name"
    t.string "rarity"
    t.string "regulation_mark"
    t.integer "retreat"
    t.string "stage"
    t.string "suffix"
    t.string "trainer_type"
    t.boolean "first_edition"
    t.boolean "holo"
    t.boolean "normal"
    t.boolean "reverse"
    t.boolean "w_promo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_set_id"], name: "index_cards_on_card_set_id"
    t.index ["name"], name: "index_cards_on_name"
    t.index ["rarity"], name: "index_cards_on_rarity"
    t.index ["stage"], name: "index_cards_on_stage"
    t.index ["trainer_type"], name: "index_cards_on_trainer_type"
  end

  create_table "cards_pokemon_types", id: false, charset: "utf8mb4", force: :cascade do |t|
    t.bigint "card_id", null: false
    t.bigint "pokemon_type_id", null: false
    t.index ["card_id", "pokemon_type_id"], name: "index_cards_pokemon_types_on_card_id_and_pokemon_type_id"
    t.index ["pokemon_type_id", "card_id"], name: "index_cards_pokemon_types_on_pokemon_type_id_and_card_id"
  end

  create_table "cards_resistances", id: false, charset: "utf8mb4", force: :cascade do |t|
    t.bigint "card_id", null: false
    t.bigint "resistance_id", null: false
    t.index ["card_id", "resistance_id"], name: "index_cards_resistances_on_card_id_and_resistance_id"
    t.index ["resistance_id", "card_id"], name: "index_cards_resistances_on_resistance_id_and_card_id"
  end

  create_table "cards_weaknesses", id: false, charset: "utf8mb4", force: :cascade do |t|
    t.bigint "card_id", null: false
    t.bigint "weakness_id", null: false
    t.index ["card_id", "weakness_id"], name: "index_cards_weaknesses_on_card_id_and_weakness_id"
    t.index ["weakness_id", "card_id"], name: "index_cards_weaknesses_on_weakness_id_and_card_id"
  end

  create_table "pokemon_types", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resistances", charset: "utf8mb4", force: :cascade do |t|
    t.string "resistance_type"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainers", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_trainers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_trainers_on_reset_password_token", unique: true
  end

  create_table "weaknesses", charset: "utf8mb4", force: :cascade do |t|
    t.string "weakness_type"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "card_sets", "card_series", column: "card_serie_id"
  add_foreign_key "cards", "card_sets"
end
