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

ActiveRecord::Schema.define(version: 2022_10_05_191357) do

  create_table "transport_types", force: :cascade do |t|
    t.string "name", null: false
    t.integer "min_distance", default: 0, null: false
    t.integer "max_distance", default: 0, null: false
    t.integer "min_weight", default: 0, null: false
    t.integer "max_weight", default: 0, null: false
    t.integer "fixed_rate", default: 0, null: false
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string "name"
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "plate", default: "xxx-000", null: false
    t.string "brand", default: "Toyota", null: false
    t.string "model", default: "Etios", null: false
    t.integer "status", default: 0, null: false
    t.integer "max_weight", default: 0, null: false
    t.integer "fabrication_year", default: 0, null: false
    t.integer "transport_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["transport_type_id"], name: "index_vehicles_on_transport_type_id"
  end

  add_foreign_key "vehicles", "transport_types"
end
