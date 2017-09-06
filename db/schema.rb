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

ActiveRecord::Schema.define(version: 20170808000000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_id", "associated_type"], name: "associated_index"
    t.index ["auditable_id", "auditable_type"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "groups", force: :cascade do |t|
    t.bigint "group_id"
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_groups_on_group_id"
    t.index ["name"], name: "index_groups_on_name"
  end

  create_table "item_expiries", force: :cascade do |t|
    t.bigint "item_id"
    t.datetime "expires"
    t.integer "count", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_expiries_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.bigint "location_id"
    t.bigint "stock_item_id"
    t.integer "required", null: false
    t.integer "order_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id", "stock_item_id"], name: "location_item_index"
    t.index ["location_id"], name: "index_items_on_location_id"
    t.index ["stock_item_id"], name: "index_items_on_stock_item_id"
  end

  create_table "locations", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "location_id"
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_locations_on_group_id"
    t.index ["location_id"], name: "index_locations_on_location_id"
    t.index ["name"], name: "index_locations_on_name"
  end

  create_table "stock_items", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.string "supplier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_stock_items_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  add_foreign_key "groups", "groups"
  add_foreign_key "item_expiries", "items"
  add_foreign_key "items", "locations"
  add_foreign_key "items", "stock_items"
  add_foreign_key "locations", "groups"
  add_foreign_key "locations", "locations"
end
