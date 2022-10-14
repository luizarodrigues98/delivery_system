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

ActiveRecord::Schema.define(version: 2022_10_14_180144) do

  create_table "arrival_time_configs", force: :cascade do |t|
    t.integer "start_distance", default: 0
    t.integer "end_distance", default: 0
    t.integer "hours", default: 0
    t.integer "transport_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["transport_type_id"], name: "index_arrival_time_configs_on_transport_type_id"
  end

  create_table "price_per_distances", force: :cascade do |t|
    t.integer "start_distance", default: 0
    t.integer "end_distance", default: 0
    t.integer "rate", default: 0
    t.integer "transport_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["transport_type_id"], name: "index_price_per_distances_on_transport_type_id"
  end

  create_table "price_per_weights", force: :cascade do |t|
    t.integer "start_weight", default: 0, null: false
    t.integer "end_weight", default: 0, null: false
    t.integer "value_per_distance", default: 0, null: false
    t.integer "transport_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["transport_type_id"], name: "index_price_per_weights_on_transport_type_id"
  end

  create_table "service_orders", force: :cascade do |t|
    t.string "address", null: false
    t.string "sku", null: false
    t.string "dimensions", null: false
    t.integer "weight", null: false
    t.string "recipient", null: false
    t.string "recipient_address", null: false
    t.integer "status", default: 0, null: false
    t.string "tracking_code"
    t.integer "total_distance", null: false
    t.integer "arrival_time"
    t.integer "total_value"
    t.datetime "delivered_at"
    t.integer "transport_type_id"
    t.integer "vehicle_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "initiated_at"
    t.string "reason"
    t.index ["transport_type_id"], name: "index_service_orders_on_transport_type_id"
    t.index ["vehicle_id"], name: "index_service_orders_on_vehicle_id"
  end

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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.integer "max_weight", default: 0, null: false
    t.integer "fabrication_year", default: 0, null: false
    t.integer "transport_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "plate"
    t.string "brand"
    t.string "model"
    t.index ["transport_type_id"], name: "index_vehicles_on_transport_type_id"
  end

  add_foreign_key "arrival_time_configs", "transport_types"
  add_foreign_key "price_per_distances", "transport_types"
  add_foreign_key "price_per_weights", "transport_types"
  add_foreign_key "service_orders", "transport_types"
  add_foreign_key "service_orders", "vehicles"
  add_foreign_key "vehicles", "transport_types"
end
