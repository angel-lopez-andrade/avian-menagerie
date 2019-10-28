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

ActiveRecord::Schema.define(version: 2019_10_28_051347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "birds", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.integer "price"
    t.string "color"
    t.text "description"
    t.bigint "breed_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["breed_id"], name: "index_birds_on_breed_id"
    t.index ["user_id"], name: "index_birds_on_user_id"
  end

  create_table "breeds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cage_varieties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cages", force: :cascade do |t|
    t.string "name"
    t.bigint "cage_variety_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cage_variety_id"], name: "index_cages_on_cage_variety_id"
  end

  create_table "snack_varieties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "snacks", force: :cascade do |t|
    t.string "name"
    t.bigint "snack_variety_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["snack_variety_id"], name: "index_snacks_on_snack_variety_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "birds", "breeds"
  add_foreign_key "birds", "users"
  add_foreign_key "cages", "cage_varieties"
  add_foreign_key "snacks", "snack_varieties"
end
